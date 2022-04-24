-- CONVERSION RATES FROM SESSIONS TO ORDERS BY DEVICE TYPE
SELECT
    website_sessions.device_type AS Device_Type,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conv_rate
FROM website_sessions 
LEFT JOIN orders 
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-05-11'
      AND website_sessions.utm_source = 'gsearch'
      AND website_sessions.utm_campaign = 'nonbrand'
GROUP BY Device_Type
ORDER BY sessions DESC;
  