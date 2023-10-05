-- 1. List all customers who live in Texas (use JOINs)
SELECT customer_id, first_name, last_name, district
FROM customer 
INNER JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 175
);


-- 4. List all customers that live in Nepal (use the city table)
SELECT customer_id, first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id 
INNER JOIN city 
ON address.city_id = city.city_id 
INNER JOIN country 
ON city.country_id = country.country_id
WHERE country = 'Angola';


-- 5. Which staff member had the most transactions?
SELECT staff.staff_id, first_name, last_name, COUNT(rental_id) AS transactions
FROM staff 
INNER JOIN rental 
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY transactions DESC LIMIT 1;


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(film_id) AS total_movies
FROM film 
GROUP BY rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);


-- 8. How many free rentals did our stores give away?
SELECT store.store_id, COUNT(payment.rental_id) AS free_rentals
FROM store
INNER JOIN staff 
ON store.store_id = staff.store_id 
INNER JOIN rental 
ON staff.staff_id = rental.staff_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE amount <= 0
GROUP BY store.store_id;





















