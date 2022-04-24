SELECT
    MIN(DATE(created_at)) AS week_start_date,
    MIN(MONTH(created_at)) AS month_start_date,
    COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_session_id ELSE NULL END) AS desktop_sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_session_id ELSE NULL END) AS mobile_sessions,
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM website_sessions 
WHERE website_sessions.created_at BETWEEN '2012-04-15' AND '2012-06-09' 
      AND website_sessions.utm_source = 'gsearch'
      AND website_sessions.utm_campaign = 'nonbrand'
GROUP BY
    YEAR(website_sessions.created_at),
    WEEK(website_sessions.created_at)
;
  