/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT
    s.store_id,
    s1.first_name,
    s1.last_name,
    a.address,
    a.address2,
    a.district,
    c.city,
    c1.country

FROM store s
    INNER JOIN staff s1
        ON s.store_id = s1.store_id
    INNER JOIN address a
        ON s1.address_id = a.address_id
    INNER JOIN city c
        ON a.city_id = c.city_id
    INNER JOIN country c1
        ON c.country_id = c1.country_id
;

/*
=================================================
SOLUTION
=================================================
*/
SELECT 
	staff.first_name AS manager_first_name, 
    staff.last_name AS manager_last_name,
    address.address, 
    address.district, 
    city.city, 
    country.country

FROM store
	LEFT JOIN staff ON store.manager_staff_id = staff.staff_id
    LEFT JOIN address ON store.address_id = address.address_id
    LEFT JOIN city ON address.city_id = city.city_id
    LEFT JOIN country ON city.country_id = country.country_id
;
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

SELECT
    i.inventory_id,
    i.store_id,
    f.title name_of_the_film, 
    f.rating film_rating,
    f.rental_rate rental_rate,
    f.replacement_cost
FROM inventory i
    LEFT JOIN film f
    ON i.film_id = f.film_id
;

/*
=================================================
SOLUTION
=================================================
*/

SELECT 
	inventory.store_id, 
    inventory.inventory_id, 
    film.title, 
    film.rating, 
    film.rental_rate, 
    film.replacement_cost
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
;

    

    



/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/

SELECT
    s.store_id,
    COUNT(i.inventory_id) total_inventory_items,
    f.rating film_rating
FROM inventory i
    INNER JOIN store s
        ON i.store_id = s.store_id
INNER JOIN film f
    ON i.film_id = f.film_id
GROUP BY s.store_id, f.rating
;

/*
=================================================
SOLUTION
=================================================
*/

SELECT 
	inventory.store_id, 
    film.rating, 
    COUNT(inventory_id) AS inventory_items
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
GROUP BY 
	inventory.store_id,
    film.rating
;











/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 
SELECT 
    i.store_id,
    c.name film_category_name,
    COUNT(fc.film_id) number_of_films,
    AVG(f.replacement_cost) avg_replacement_cost,
    SUM(f.replacement_cost) total_replacement_cost
FROM inventory i
    INNER JOIN film_category fc
        ON i.film_id = fc.film_id
    INNER JOIN category c
        ON c.category_id = fc.category_id
    INNER JOIN film f
        ON i.film_id = f.film_id
GROUP BY 1,2
ORDER BY SUM(f.replacement_cost) DESC 
;

/*
=================================================
SOLUTION
=================================================
*/

SELECT 
	store_id, 
    category.name AS category, 
	COUNT(inventory.inventory_id) AS films, 
    AVG(film.replacement_cost) AS avg_replacement_cost, 
    SUM(film.replacement_cost) AS total_replacement_cost
    
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
	LEFT JOIN film_category
		ON film.film_id = film_category.film_id
	LEFT JOIN category
		ON category.category_id = film_category.category_id

GROUP BY 
	store_id, 
    category.name

ORDER BY SUM(film.replacement_cost) DESC 
;


/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/

SELECT
  c.first_name,
  c.last_name,
  CASE WHEN c.store_id = 1 THEN 'Store 1' ELSE 'Store 2' END store,
  CASE WHEN c.active = 1 THEN 'Active' ELSE 'Inactive' END status,
  a.address,
  c1.city,
  c2.country
FROM customer c
    INNER JOIN address a
        ON c.address_id = a.address_id
    INNER JOIN city c1
        ON a.city_id = c1.city_id
    INNER JOIN country c2
        ON c1.country_id = c2.country_id
;

/*
=================================================
SOLUTION
=================================================
*/

SELECT 
	customer.first_name, 
    customer.last_name, 
    customer.store_id,
    customer.active, 
    address.address, 
    city.city, 
    country.country

FROM customer
	LEFT JOIN address ON customer.address_id = address.address_id
    LEFT JOIN city ON address.city_id = city.city_id
    LEFT JOIN country ON city.country_id = country.country_id
;








/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

SELECT 
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) total_lifetime_rentals,
    SUM(p.amount) total_payments_collected
FROM customer c
    INNER JOIN rental r 
        ON c.customer_id = r.customer_id
    INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY 1,2
ORDER BY 4 DESC
;

/*
=================================================
SOLUTION
=================================================
*/

SELECT 
	customer.first_name, 
    customer.last_name, 
    COUNT(rental.rental_id) AS total_rentals, 
    SUM(payment.amount) AS total_payment_amount

FROM customer
	LEFT JOIN rental ON customer.customer_id = rental.customer_id
    LEFT JOIN payment ON rental.rental_id = payment.rental_id

GROUP BY 
	customer.first_name,
    customer.last_name

ORDER BY 
	SUM(payment.amount) DESC
    ;








    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/


SELECT
	'investor' AS type, 
    first_name, 
    last_name, 
    company_name
FROM investor

UNION 

SELECT 
	'advisor' AS type, 
    first_name, 
    last_name, 
    NULL
FROM advisor;



/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

SELECT
	CASE 
		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
		ELSE '1 award'
	END AS number_of_awards, 
    AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS pct_w_one_film
	
FROM actor_award
	

GROUP BY 
	CASE 
		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
		ELSE '1 award'
	END