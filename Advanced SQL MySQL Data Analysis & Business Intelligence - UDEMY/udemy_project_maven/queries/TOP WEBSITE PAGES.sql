SELECT
    wp.pageview_url AS page_url,
    COUNT(DISTINCT wp.website_pageview_id) AS page_views
FROM website_pageviews AS wp
WHERE wp.website_pageview_id < 1000
GROUP BY 1 
ORDER BY 2 DESC
;
