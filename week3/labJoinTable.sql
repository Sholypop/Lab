USE sakila;
#1.Which actor has appeared in the most films?
SELECT first_name, last_name, count(film_id) FROM actor 
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id 
ORDER BY count(film_id) DESC
LIMIT 1;
#2.Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id) FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY count(rental_id) DESC
LIMIT 1;
#3.List number of films per category.
SELECT distinct(name), count(film_id) FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.category_id
ORDER BY count(film_id) ASC;
#4.Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address FROM staff
JOIN address ON staff.address_id = address.address_id;
#5.get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT title, language.name FROM film
JOIN language ON film.language_id = language.language_id
WHERE language.name IN ('English', 'italian') AND title LIKE 'M%'
ORDER BY title DESC;
#6.Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, sum(amount) FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY first_name, last_name
ORDER BY first_name;
#7. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY title;
#8.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, sum(amount) FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY first_name,last_name
ORDER BY last_name;
#9.Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT first_name, last_name, film_id FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_id IS NULL; 
#10.get the addresses that have NO customers, and ends with the letter "e"
SELECT address.address, first_name, last_name FROM  address 
LEFT JOIN customer ON customer.address_id = address.address_id
WHERE address LIKE '%e' AND first_name is NuLL;