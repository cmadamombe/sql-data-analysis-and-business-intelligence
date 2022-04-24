SELECT
    MIN(DATE(ws.created_at)) week_start,
    COUNT(DISTINCT ws.website_session_id) sessions
FROM  website_sessions ws
WHERE ws.created_at < '2012-05-10' AND ws.utm_source = 'gsearch' AND ws.utm_campaign = 'nonbrand'
GROUP BY WEEK(ws.created_at)
;