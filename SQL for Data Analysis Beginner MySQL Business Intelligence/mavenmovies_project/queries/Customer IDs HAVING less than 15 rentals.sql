SELECT
   r.customer_id,
    COUNT(r.rental_id) total_rentals
FROM rental r
GROUP BY r.customer_id
HAVING total_rentals < 15
;