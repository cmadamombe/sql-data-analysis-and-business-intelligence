SELECT
    wp.pageview_url,
    COUNT(DISTINCT wp.website_pageview_id) wpvs
FROM website_pageviews wp
WHERE wp.created_at < '2012-06-09'
GROUP BY wp.pageview_url
ORDER BY wpvs DESC
;