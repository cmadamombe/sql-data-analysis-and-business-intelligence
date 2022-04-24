SELECT
 c.store_id,
 COUNT(CASE WHEN c.active = 0 THEN c.customer_id ELSE NULL END) Inactive,
 COUNT(CASE WHEN c.active = 1 THEN c.customer_id ELSE NULL END) Active
FROM customer c
GROUP BY c.store_id
;