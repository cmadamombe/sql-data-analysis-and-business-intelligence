﻿SELECT
    website_sessions.utm_content,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS Orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS Session_To_Order_Coversation_rate

FROM website_sessions
LEFT JOIN orders
ON orders.website_session_id = website_sessions.website_session_id 
WHERE website_sessions.website_session_id BETWEEN 1000 AND 2000
GROUP BY 1 
ORDER BY 2 DESC;
