use sakila;
show tables;
## 1.Strings (LPAD + RPAD)
## right pad.
SELECT title, RPAD(title, 20, '*') AS padded_title
FROM sakila.film
LIMIT 5;
## LEFT PAD
SELECT title, LPAD(title, 20, '*') AS left_padded
FROM sakila.film
LIMIT 5;

####SUBSTRING 
####..Extracts  5 characters starting from position 2..Used to take part of a string.
SELECT title, SUBSTRING(title, 2, 5) AS short_title 
FROM sakila.film;

### String Concatenation..Combines first name + “#” + last name into one string.
SELECT CONCAT(first_name, '%', last_name) AS full_name 
FROM sakila.customer;

####Reverse a String
SELECT title, DESCRIPTION,REVERSE(TITLE) AS reversed_title,REVERSE(DESCRIPTION) AS REVERSED_DESCRIPTION
FROM sakila.film
LIMIT 5;

###LENGTH
SELECT title, LENGTH(title) AS title_length 
FROM sakila.film;

SELECT title, LENGTH(title) AS title_length 
FROM sakila.film
WHERE LENGTH(title) = 8;
----------------------------
###LOCATE
### LOCATE('@', email) finds position of @ ..Substring extracts everything after @ (domain).
SELECT email,
       SUBSTRING(email, LOCATE('@', email) +1) AS domain
FROM sakila.customer;

#### DATEDIFF
SELECT rental_id, return_date, rental_date, DATEDIFF(return_date, rental_date) AS days_rented
FROM sakila.rental;
## MONTH ,MONTHNAME
select last_update, month(last_update), monthname(last_update) 
from sakila.film;
## YEAR
SELECT rental_date, year(rental_date)
FROM sakila.rental;

### LAST 24 HRS, TO GET PAYMENTS DONE IN LAST24 HRS USING INTERVAL.
SELECT customer_id, amount, payment_date
FROM sakila.payment
WHERE payment_date >= NOW() - INTERVAL 1 DAY;

SELECT customer_id, amount, payment_date
FROM sakila.payment
WHERE payment_date >= (
    SELECT MAX(payment_date) - INTERVAL 10 day
    FROM sakila.payment
);

### REGEXP.
##.Find titles whose LAST letter is A or B
SELECT title, title REGEXP '[AC]^' AS match_result
FROM film;

###  SUBSTRING_INDEX
SELECT 
    email,
    SUBSTRING_INDEX(SUBSTRING_INDEX(email, '.',2), '@', 1) AS middle_part
FROM sakila.customer;

SELECT 
    title, 
    UPPER(title), 
    LOWER(title)
FROM sakila.film
WHERE 
    UPPER(title) LIKE '%ACTION%' 
    OR 
    UPPER(title) LIKE '%LOVE';
    
    ### case
    SELECT 
    last_name,
    CASE
        WHEN RIGHT(last_name, 1) IN ('A','E','I','O','U') 
            THEN 'Ends with Vowel'
        WHEN RIGHT(last_name, 1) BETWEEN 'A' AND 'Z'
            THEN 'Ends with Consonant'
        ELSE 'Other'
    END AS name_category
FROM sakila.customer;

##
SELECT title, REPLACE(title, 'B', 'x') AS cleaned_title
FROM sakila.film
WHERE title LIKE '% ' '%';
### REGEXP VOWELS
SELECT customer_id, last_name
FROM sakila.customer
WHERE last_name  REGEXP '[^aeiouAEIOU]{3}';

### MATH multiplies.
SELECT title, rental_rate, rental_rate * 2  AS double_rate   
FROM sakila.film;
##adding a new empty box in every row so you can put new data later.
ALTER TABLE sakila.film
ADD COLUMN cost_efficiency_dup1 DECIMAL(6,2);







