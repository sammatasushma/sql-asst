-- SHOW THE 10 longest films that are never rented


SELECT title, length FROM film
WHERE film_id not in(
    SELECT inventory.film_id FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
)
ORDER BY length DESC
LIMIT 10;

-- find the customers who rented the same film more than once
select * from customer;
select * from inventory;
select * from film;

SELECT r.customer_id, i.film_id, COUNT(*) AS total_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY r.customer_id, i.film_id
HAVING COUNT(*) > 1;

-- Join rental with inventory to know which film was rented

-- list all the actors whos first name and last name starts with the same letter using wild card

SELECT * FROM actor
where LEFT(first_name, 1) = LEFT(last_name, 1)
ORDER BY first_name, last_name;

-- count rentals per week day and show which week day brings the highest revenue

SELECT * from rentals;
SELECT DAYNAME(r.rental_date) AS weekday, SUM(p.amount) AS highest_revenue
FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY weekday
ORDER BY highest_revenue DESC
LIMIT 1;


-- Find the customers whos local part before @ is shorter than 5 characters

select * from customer;
select customer_id, first_name, last_name, email
FROM customer
WHERE LENGTH(SUBSTRING_INDEX (EMAIL, '@' , 1)) <5;

select * from staff;
select * from customer;
select * from payments;

SELECT p.staff_id, SUM(p.amount) AS total_amount, 
COUNT(DISTINCT p.customer_id) AS distinct_customers
FROM payment p
GROUP BY p.staff_id;

-- list the film whos length is above the average length of there language using subquries

select * from film;
SELECT title, length, language_id
FROM film f
WHERE length > (
    SELECT AVG(length)
    FROM film
    WHERE language_id = f.language_id
);

-- write a query to show inventory count per film per store

select * from film;
select * from inventory;
select * from store;

SELECT i.store_id, f.title, COUNT(*) AS inventory_count
FROM inventory i
JOIN film f ON i.film_id = f.film_id
GROUP BY i.store_id, f.title;

-- find the category whos avg rental duration is above global avg

select * from rental;
select * from category;
select * from film;
select * from film_category;

SELECT c.name, AVG(f.rental_duration) AS avg_duration
FROM film f
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY c.name
HAVING AVG(f.rental_duration) >
 (SELECT AVG(rental_duration) FROM film);
 
 
 
 
 
 -- Show categories where the average film length is between 90 and 120 minutes 
 -- and the stddev of length > 15.
 
 select * from film;
 SELECT * FROM CATEGORY;
 
 Select c.name AS category_name, AVG(F.LENGTH) AS AVG_length,
 STDDEV_SAMP(f.length) AS stddev_length
 from film f
 JOIN film_category fc ON f.film_id = fc.film_id
 JOIN category c ON fc.category_id = c.category_id
 GROUP BY c.category_id, c.name
 HAVING AVG(f.length) between 90 and 120
 and stddev_samp(f.length) > 15;


