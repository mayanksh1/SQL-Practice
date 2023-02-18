--SELECT

SELECT first_name,last_name
FROM actor;

--LIMIT

SELECT * FROM actor
LIMIT 50 ;

--WHERE & Comparison Operators

SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >=19.99
AND rating='R';

--SQL Logical Operators 
--LIKE (Case-Sensitive) & ILIKE (Case-Insensitive)
--'A%' strint start with alphabet A and '%A' string end with alphabet'A'

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE'B%'
ORDER BY last_name;

-- IN

SELECT * FROM customer
WHERE fisrt_name IN ('John','Jake','Julie');

SELECT * FROM payment
WHERE amount IN (0.99,1.95,1.99);

-- BETWEEN & AND

SELECT * FROM payment
WHERE patment_date BETWEEN '2007-02-01' AND '2007-02-2015';

--NULL

SELECT amount FROM payment
WHERE amount IS NULL;

--OR

SELECT * FROM payment
WHERE  customer_id = '341' OR staff_id ='1';

-- NOT

SELECT * FROM customer
WHERE store_id ='1'
AND first_name NOT LIKE '%P';

--ORDER BY

SELECT first_name, last_name FROM customer
ORDER BY store_id DESC,first_name ASC;

-- COUNT

SELECT COUNT(amount)FROM payment;

-- DISTINCT

SELECT COUNT(DISTINCT(amount)) FROM payment;

-- SUM

SELECT SUM(amount)FROM payment;

-- MIN & MAX

SELECT MIN(amount) AS min_amount, MAX(amount) AS max_amount
FROM payment;

--AVG

SELECT AVG(amount)AS avg_amount 
FROM payment;

--GROUP BY

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id;

----------------------------------------

SELECT DATE(payment_date), SUM(amount) 
FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

--ROUND

SELECT ROUND (AVG(replacement_cost),2)
FROM film;

--HAVING

SELECT store_id, COUNT(customer_id) 
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id)>300;

--CASE

SELECT customer_id,
CASE
	WHEN (customer_id <=100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Golden'
	ELSE 'Basic'
END
FROM customer;

-------------------------------------------
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'First Place'
	WHEN 5 THEN 'Second Place'
	ELSE 'Third Place'
END AS customer_position
FROM customer;
--------------------------------------------
SELECT 
SUM (CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS rare,
SUM (CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM (CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

--JOIN & INNER JOIN

SELECT payment_id, payment.customer_id,first_name
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id;

---------------------------------------------

--Full OUTER JOIN

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
	WHERE customer.customer_id IS null
	OR payment.payment_id IS null;


--LEFT Outer Join OR Left Join

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id;
-----------------------------------------------
SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;
