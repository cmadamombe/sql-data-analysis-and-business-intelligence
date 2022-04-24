-- SITE TRAFFIC BREAKDOWN
SELECT
    website_sessions.utm_source,
    website_sessions.utm_campaign,
    website_sessions.http_referer,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY
    website_sessions.utm_source,
    website_sessions.utm_campaign,
    website_sessions.http_referer
ORDER BY sessions DESC;
