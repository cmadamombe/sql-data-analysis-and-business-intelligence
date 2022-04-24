SELECT
    primary_product_id,
    COUNT(DISTINCT CASE WHEN orders.items_purchased = 1 THEN orders.order_id ELSE NULL END) AS count_signle_item_orders,
    COUNT(DISTINCT CASE WHEN orders.items_purchased = 2 THEN orders.order_id ELSE NULL END) AS count_two_item_orders
FROM orders 
WHERE order_id BETWEEN 31000 AND 32000
GROUP BY 1
;