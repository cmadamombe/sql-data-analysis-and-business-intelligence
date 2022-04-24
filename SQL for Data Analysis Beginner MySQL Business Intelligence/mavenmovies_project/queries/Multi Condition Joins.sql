SELECT
    f.title,
    f.description,
    i.store_id
FROM inventory i
    INNER JOIN film f
        ON i.film_id = f.film_id 
        AND i.store_id = 2