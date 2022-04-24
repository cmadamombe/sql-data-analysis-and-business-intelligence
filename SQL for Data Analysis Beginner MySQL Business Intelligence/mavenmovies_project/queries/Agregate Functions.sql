SELECT 
    f.replacement_cost,
    COUNT(f.film_id) number_of_films,
    AVG(f.rental_rate) avg_rental_rate,
    MIN(f.rental_rate) min_rental_rate,
    MAX(f.rental_rate) max_rental_rate
FROM film f
GROUP BY f.replacement_cost
;