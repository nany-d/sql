USE sakila;

DESCRIBE actor;

-- 1
SELECT * FROM actor;

-- 2
SELECT last_name FROM actor WHERE first_name = 'John';

-- 3
SELECT * FROM actor WHERE last_name = 'Neeson';

-- 4
SELECT * FROM actor WHERE actor_id % 10 = 0;

-- 5
DESCRIBE film;

SELECT * FROM film;

SELECT `description` FROM film WHERE film_id = 100;

-- 6

SELECT * FROM film WHERE rating = 'r';

-- 7

SELECT * FROM film WHERE rating != 'r';

-- 8

SELECT * FROM film ORDER BY length LIMIT 10;

-- 9

SELECT MAX(length) FROM film;

SELECT * FROM film
	WHERE length = (SELECT MAX(length) FROM film);
    
-- 10

SELECT * FROM film WHERE special_features LIKE '%deleted scenes%';

-- 11

DESCRIBE actor;

SELECT * FROM actor;

SELECT COUNT(*) AS frequency, last_name FROM actor GROUP BY last_name HAVING frequency = 1 ORDER BY last_name DESC;

-- 12

SELECT COUNT(*) AS frequency, last_name FROM actor GROUP BY last_name HAVING frequency > 1 ORDER BY frequency DESC;

-- 13

DESCRIBE film_actor;

SELECT * FROM film_actor;

SELECT * FROM actor_info;

SELECT COUNT(*) AS frequency, actor_id FROM film_actor GROUP BY actor_id ORDER BY frequency DESC LIMIT 1;

SELECT CONCAT(first_name,' ',last_name) AS actor_appearing_in_most_films FROM actor 
	WHERE actor_id = (SELECT actor_id FROM (SELECT COUNT(*) AS frequency, actor_id FROM film_actor GROUP BY actor_id ORDER BY frequency DESC LIMIT 1) AS most_films_actor);
    
-- 14

SELECT * FROM film;

SELECT * FROM inventory;

SELECT * FROM rental;

SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR';

SELECT inventory_id FROM inventory 
	WHERE film_id = (SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR');
    
SELECT return_date FROM rental
	WHERE inventory_id < (SELECT inventory_id FROM inventory 
		WHERE film_id = (SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR') ORDER BY inventory_id DESC LIMIT 1) ORDER BY return_date DESC LIMIT 1;
-- How to have WHERE trigger multiple subqueries?

-- 15

SELECT AVG(length) FROM film;

-- 16

-- SELECT * FROM film_category;

-- SELECT COUNT(*) AS avg_length, length FROM film JOIN film_category ON film.film_id = film_category.film_id GROUP BY category_id;

SELECT * FROM film_list;

SELECT AVG(length) AS avg_length, category FROM film_list GROUP BY category;

-- 17

SELECT * FROM film;

SELECT title FROM film WHERE `description` LIKE '%robot%';