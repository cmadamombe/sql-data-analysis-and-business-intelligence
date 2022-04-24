﻿SELECT
MIN(DATE(website_sessions.created_at)) AS week_start_date,
COUNT(DISTINCT website_sessions.website_session_id) AS sessions
FROM website_sessions
WHERE website_sessions.created_at < '2012-05-10'
      AND website_sessions.utm_source = 'gsearch'
      AND website_sessions.utm_campaign = 'nonbrand'
GROUP BY 
    -- YEAR(created_at), 
    WEEK(created_at)
;
