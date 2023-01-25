USE sakila;
#1. SELECT title FROM film
SELECT title FROM film
WHERE length > (SELECT avg(length) FROM film);
#2.How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT count(inventory_id) from inventory
WHERE film_id in (SELECT film_id from film
                  WHERE title = 'Hunchback Impossible');
#3.Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor
                   WHERE film_id in (SELECT film_id FROM film 
                                     WHERE title = 'Alone Trip'));
#4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_category
                  WHERE category_id in (SELECT category_id FROM category
                                        WHERE name = 'Family'));
#5.Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, 
#you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the 
#relevant information.
SELECT first_name, last_name, email FROM customer
WHERE address_id in (SELECT address_id FROM address
                     WHERE city_id in (SELECT city_id FROM city
                                       WHERE country_id in (SELECT country_id FROM country
                                                            WHERE country = 'Canada')));
#with join
SELECT first_name, last_name, email FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Canada';
#6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in 
#the most number of films. First you will have to find the most prolific actor and then use that actor_id to find 
#the different films that he/she starred.
SELECT first_name, last_name, actor_id FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor
                   WHERE film_id in (SELECT count(film_id) FROM film));
                   
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
                  WHERE actor_id in (SELECT actor_id FROM actor
				                     WHERE actor_id in (155,166,178)
                                     GROUP BY actor_id));