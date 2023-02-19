-- EXTRACT

SELECT EXTRACT(YEAR FROM payment_date) AS year
FROM payment;

SELECT EXTRACT(QUARTER FROM payment_date)
AS pay_month
FROM payment;

SELECT AGE (payment_date)
FROM payment;


SELECT TO_CHAR (payment_date,'MONTH-YYYY')
FROM payment;


SELECT TO_CHAR (payment_date,'MM-DD-YYYY')
FROM payment;

-- TIMESTAMPING
SELECT first_name
WHERE first_name LIKE '%J'::TIMESTAMP + INTERVIEW
FROM customer;











































