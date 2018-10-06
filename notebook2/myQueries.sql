/*EJ2*/
source saquila.sql
/*EJ3*/
SET sql_mode='';
SELECT title FROM film;
SELECT title FROM film LIMIT 10;
SELECT title FROM film WHERE rental_duration>=4;
SELECT customer_id,rental_id,amount,payment_date from payment where payment_date BETWEEN CAST("2005-07-01" as date) and CAST("2005-08-01" as date);
/*EJ4*/
/*4.1*/
SELECT COUNT(*) FROM customer;
/*4.2*/
SELECT customer_id,COUNT(*) FROM rental GROUP BY customer_id;
/*4.3*/
SELECT MAX(total) FROM (SELECT customer_id,count(*) as total FROM rental GROUP BY customer_id) as t1;
/*Muestra la cantidad máxima de arriendos hecha por un cliente*/
/*4.5*/
SELECT staff_id,count(*) AS total FROM payment GROUP BY staff_id;
/*4.6*/
SELECT MAX(staff),staff_id FROM(SELECT staff_id,count(*)  as staff 
from payment where payment_date BETWEEN   cast('2005-08-23 00:00:00' AS DATE)
AND CAST('2005-08-24 00:00:00' AS DATE) GROUP BY staff_id) as t2;
/*EJ5*/
/*5.1*/
SELECT title,name FROM film INNER JOIN language ON film.language_id=language.language_id;
/*5.2*/
SELECT first_name,last_name,inventory_id,title FROM customer INNER JOIN film ON film.title="CHICAGO NORTH" INNER JOIN inventory ON inventory.film_id = film.film_id;
/*5.3*/
SELECT first_name,last_name,city FROM customer INNER JOIN address ON customer.address_id = address.address_id INNER JOIN city ON address.city_id = city.city_id;
/*5.4*/
SELECT title,count(*) FROM film INNER JOIN inventory ON film.film_id = inventory.film_id INNER JOIN rental ON inventory.inventory_id=rental.inventory_id GROUP BY title ORDER BY count(*) ASC;
/*5.5*/
SELECT title,MAX(total) FROM (SELECT title,sum(amount) AS total FROM payment INNER JOIN rental ON payment.rental_id=rental.rental_id
INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id INNER JOIN film ON inventory.film_id=film.film_id GROUP BY title) AS tfinal;  
/*5.6*/
SELECT first_name,last_name,amount FROM customer INNER JOIN payment USING(customer_id) WHERE amount>10;
