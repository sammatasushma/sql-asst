use sakila;
### 1.  
select c.customer_id,c.first_name,c.last_name, count(p.payment_id) as total_payments 
from customer c
join payment p on p.customer_id =c.customer_id
group by c.customer_id
having count(p.payment_id) > 5;


## 2.
select a.actor_id ,a.first_name,last_name,count(f.film_id) as total_films
from actor a
join film_actor f on a.actor_id = f.actor_id
group by a.actor_id
having count(f.film_id) >10;

### 3. Find the names of customers who never made a payment.
select c.customer_id,concat(c.first_name,c.last_name) as name ,p.amount
from customer c
join payment p on c.customer_id =p.customer_id
where p.amount is null; 

 select c.customer_id,p.amount, concat(c.first_name,c.last_name) as name
from customer c
join payment p on c.customer_id =p.customer_id
where p.amount >= 0.99;
## 4. List all films whose rental rate is higher than the average rental rate of all films.

SELECT title, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
);


#### ### 5. List the titles of films that were never rented.
select title
from film
where rental_duration is null;
###JOIN
SELECT 
    f.film_id,
    f.title
FROM film f
LEFT JOIN inventory i 
    ON f.film_id = i.film_id
LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;


## 6.. Display the customers who rented films in the same month as customer with ID 5.
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM rental r
JOIN customer c 
    ON r.customer_id = c.customer_id
WHERE MONTH(r.rental_date) IN (
    SELECT MONTH(rental_date)
    FROM rental
   WHERE CUSTOMER_ID =5
);

### 7. Find all staff members who handled a payment greater than the average payment amount.

SELECT DISTINCT S.staff_id, S.first_name, S.last_name
FROM staff S
JOIN payment P  
    ON s.staff_id = p.staff_id
WHERE p.amount > (
    SELECT AVG(amount)
    FROM payment
);
## 8. Show the title and rental duration of films whose rental duration is greater than the average.

SELECT 
    title,
    rental_duration
FROM film
WHERE rental_duration > (
    SELECT AVG(rental_duration)
    FROM film
);

##9. Find all customers who have the same address as customer with ID 1.
SELECT 
    customer_id,first_name,last_name,address_id
FROM customer 
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 1);

##10. List all payments that are greater than the average of all payments.
SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount)FROM payment);




