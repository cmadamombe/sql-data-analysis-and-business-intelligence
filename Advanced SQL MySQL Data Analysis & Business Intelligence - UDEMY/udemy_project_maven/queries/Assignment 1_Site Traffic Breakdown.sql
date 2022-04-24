-- SITE TRAFFIC BREAKDOWN BY SOURCE, CAMPAIGN AND REFERRER

SELECT
    ws.utm_source,
    ws.utm_campaign,
    ws.http_referer,
    COUNT(DISTINCT ws.website_session_id) sessions
FROM website_sessions ws
WHERE ws.created_at < '2012-04-12'
GROUP BY 1,2,3
ORDER BY sessions DESC
;