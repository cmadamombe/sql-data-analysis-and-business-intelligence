SELECT 
    *
FROM payment
WHERE 
    customer_id <= 100
    AND amount >= 5
    AND payment_date > '2006-01-01'
;

SELECT 
    special_features
FROM film
WHERE  special_features  LIKE '%Behind the Scenes%'
;