SELECT
    YEAR(created_at) AS YEAR,
    MONTH(created_at) AS MONTH,
    WEEK(created_at) AS WEEK,
    MIN(DATE(created_at)) AS WEEK_START,
    MAX(DATE(created_at)) AS WEEK_END,
    COUNT(DISTINCT website_session_id) AS SESSIONS
FROM website_sessions AS ws
WHERE ws.website_session_id BETWEEN 100000 AND 115000 
GROUP BY 1,2,3
ORDER BY SESSIONS DESC
;

