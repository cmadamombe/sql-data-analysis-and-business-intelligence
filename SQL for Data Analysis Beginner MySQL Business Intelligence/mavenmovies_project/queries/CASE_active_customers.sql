SELECT 
    c.first_name,
    c.last_name,
        (CASE WHEN c.store_id = 1 AND c.active = 1 THEN 'Store 1 Active' 
              WHEN c.store_id = 1 AND c.active = 0 THEN 'Store 1 Inactive' 
              WHEN c.store_id = 2 AND c.active = 1 THEN 'Store 2 Active'
              WHEN c.store_id = 2 AND c.active = 0 THEN 'Store 2 Inactive'
        ELSE NULL 
        END) active
FROM customer c
; 