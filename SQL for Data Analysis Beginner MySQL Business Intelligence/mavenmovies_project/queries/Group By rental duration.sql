SELECT
    COUNT(f.title) num_of_titles,
    f.rental_duration 
FROM film f
GROUP BY 2
;