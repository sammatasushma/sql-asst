
USE SAKILA;
SHOW TABLES;
SELECT * FROM FILM;
SELECT * FROM CUSTOMER;

--- --1 Get all customers whose first name starts with 'J' and who are active
SELECT * FROM Sakila.customer
WHERE first_name LIKE 'J%' 
  AND active = 1;
  
----------------------
--- -2 Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
SELECT * FROM Sakila.Film
WHERE Title LIKE '%ACTION%'
 OR Description LIKE '%WAR%';
 
-----------------------
-- 3List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
SELECT * FROM Sakila.customer
Where Last_name !='SMITH'
AND first_name Like '%a';
 
 --------------------
 -- 4 Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
SELECT * FROM Sakila.film
WHERE rental_rate > 3.0
 AND replacement_cost IS NOT NULL;
 
 -- 5 Count how many customers exist in each store who have active status = 1.
SELECT COUNT(*) FROM sakila.customer
WHERE each_store
 AND ACTIVE = '1';
 
-- 6 Show distinct film ratings available in the film table.

SELECT distinct rating FROM sakila.film;

-- 7 Find the number of films for each rental duration where the average length is more than 100 minutes.

select rental_duration, COUNT(*) AS film_count from sakila.film
GROUP BY rental_duration 
HAVING avg(length) >100;

-- 8 List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
 SELECT DATE (payment_date) AS payment_day,
 SUM(AMOUNT) AS total_amount,
 COUNT(*) AS payment_count
 FROM payment
 GROUP by payment_day
 HAVING COUNT(*) >100;
 
 --- 9 Find customers whose email address is null or ends with '.org'.
 SELECT email FROM sakila.customer
WHERE EMAIL IS NULL
  OR email LIKE '%.org';
  
  -- 10 List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
  
  SELECT * FROM sakila.film
WHERE (rating = 'G' OR rating = 'PG')
ORDER BY rental_rate DESC;
  
 -- 11 Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
 
 SELECT length , COUNT(*) AS film_count 
 FROM film
 WHERE title LIKE 'T%'
GROUP BY length 
HAVING COUNT(*) > 5;

-- 13 Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
SELECT rental_rate , length FROM sakila.film 
ORDER BY rental_rate desc, length desc 
Limit 5;


 
 
  
 
 
 

 
 
 
 
 



 
 
 
   



