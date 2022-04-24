SELECT
    MIN(DATE(ws.created_at)) week_start_date,
    COUNT(DISTINCT CASE WHEN ws.device_type = 'mobile' THEN ws.website_session_id ELSE NULL END) mobile_sessions,
    COUNT(DISTINCT CASE WHEN ws.device_type = 'desktop' THEN ws.website_session_id ELSE NULL END) desktop_sessions
FROM  website_sessions ws
WHERE ws.created_at BETWEEN '2012-04-15' AND '2012-06-09' 
    AND ws.utm_source = 'gsearch' AND ws.utm_campaign = 'nonbrand'
GROUP BY YEAR(ws.created_at), WEEK(ws.created_at)
;

