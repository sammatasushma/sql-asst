use sakila;
show tables;
-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates

SELECT first_name, last_name, email, COUNT(*) AS duplicate_count
FROM customer
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;
--  2. Number of times letter 'a' is repeated in film descriptions
SELECT 
    title, description,
    LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', '')) AS a_count
FROM film;

-- 3. Number of times each vowel is repeated in film descriptions 
SELECT 
    title, description,
    LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', '')) AS a_count
FROM film;

SELECT 
    title,description,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', '')) AS count_a,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'e', '')) AS count_e,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'i', '')) AS count_i,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'o', '')) AS count_o,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'u', '')) AS count_u
FROM film;

--  5 .Display the payments made by each customer
       ## 1. Month wise
       ## 2. Year wise
       ## 3. Week wise
### YEAR
SELECT 
    customer_id,
    YEAR(payment_date) AS payment_year,
    SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, YEAR(payment_date)
ORDER BY customer_id, payment_year;

### MONTH
SELECT 
    customer_id,
    DATE_FORMAT(payment_date, '%Y-%m') AS payment_month,
    SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY customer_id, payment_month;
###
## WEEK
SELECT
    customer_id,
    YEAR(payment_date) AS payment_year,
    WEEK(payment_date, 1) AS payment_week,
    SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, YEAR(payment_date), WEEK(payment_date, 1)
ORDER BY customer_id, payment_year, payment_week;

--  6. Display number of days remaining in the current year from today.

SELECT 
    CASE 
        WHEN ((2024 % 4 = 0) AND (2024 % 100 <> 0)) OR (2024 % 400 = 0)
        THEN 'Leap Year' 
        ELSE 'Not a Leap Year' 
    END AS result;
    
    SELECT 
    DATEDIFF(
        STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-12-31'), '%Y-%m-%d'),
        CURDATE()
    ) AS days_remaining;
    
    -- 7. 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table. 

    SELECT 
    payment_id,
    payment_date,
    CONCAT('Q', QUARTER(payment_date)) AS quarter
FROM payment;

--  8.  Display the age in year, months, days based on your date of birth. 
   ## For example: 21 years, 4 months, 12 days
SELECT 
    CONCAT(
        TIMESTAMPDIFF(YEAR, '1998-06-10', CURDATE()), ' years, ',
        TIMESTAMPDIFF(MONTH, '1998-06-10', CURDATE()) 
            - TIMESTAMPDIFF(YEAR, '1998-06-10', CURDATE()) * 12, ' months, ',
        DATEDIFF(
            CURDATE(), 
            DATE_ADD(
                '1998-06-10',
                INTERVAL TIMESTAMPDIFF(MONTH, '1998-06-10', CURDATE()) MONTH
            )
        ), ' days'
    ) AS age;
    



