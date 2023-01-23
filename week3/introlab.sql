USE sakila;
#1. Select one column from a table. Get film titles.
SELECT title FROM film;
#2. Select one column from a table and alias it. Get unique list of film languages under the alias language.
# Note that we are not asking you to obtain the language per each film, but this is a good time to 
#think about how you might get that information in the future.
SELECT distinct(name) AS language FROM language
INNER JOIN film
WHERE film.language_id = language.language_id;
# 3. Find out how many stores does the company have?
SELECT count(store_id) FROM store;
# 4. Find out how many employees staff does the company have?
SELECT count(staff_id) FROM staff;
# 5. Return a list of employee first names only?
SELECT first_name FROM staff;