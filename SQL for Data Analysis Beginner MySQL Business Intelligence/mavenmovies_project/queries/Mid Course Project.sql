use mavenmovies;

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

SELECT
    s.first_name,
    s.last_name,
    s.email,
    s.store_id
FROM staff s
;






/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 

SELECT
    i.store_id,
    COUNT(i.inventory_id) no_of_inventory
FROM inventory i
GROUP BY 1
;





/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/
SELECT
    c.store_id,
    COUNT(CASE WHEN c.active = 1 THEN c.customer_id ELSE NULL END) active_customers
    -- COUNT(CASE WHEN c.active = 0 THEN c.customer_id ELSE NULL END) inactive_customers
FROM customer c
GROUP BY c.store_id
;







/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/

SELECT
   -- c.store_id,
    COUNT(c.email) number_of_email_addresses
FROM customer c
-- GROUP BY c.store_id
;





/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/

SELECT
    i.store_id,
    COUNT(DISTINCT i.film_id) no_of_unique_titles
FROM inventory i
GROUP BY 1
;


SELECT
    -- fc.category_id,
    COUNT(DISTINCT c.category_id) no_of_unique_categories
FROM category c
-- GROUP BY 1
;





/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

SELECT 
     -- f.release_year,
    MIN(f.replacement_cost) least_expensive_replacement,
    MAX(f.replacement_cost) most_expensive_replacement,
    AVG(f.replacement_cost) avg_expensive_replacement
FROM film f
-- GROUP BY f.release_year
;





/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/

SELECT
    -- YEAR(p.payment_date) year,
    AVG(p.amount) avg_payment,
    MAX(p.amount) max_payment
FROM payment p
-- GROUP BY 1
;



/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/
SELECT
    r.customer_id,
    COUNT(r.rental_id) total_rentals
FROM rental r
GROUP BY 1
ORDER BY total_rentals DESC
;

