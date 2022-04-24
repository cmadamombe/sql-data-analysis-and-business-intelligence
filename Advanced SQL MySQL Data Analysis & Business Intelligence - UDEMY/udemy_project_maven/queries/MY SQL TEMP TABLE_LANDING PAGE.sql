USE mavenfuzzyfactory;

CREATE TEMPORARY TABLE temp_first_page_view

SELECT
    wp.website_session_id,
    MIN(wp.website_pageview_id) AS min_pv_id -- first page view ID that shows up
FROM website_pageviews AS wp
WHERE wp.website_pageview_id < 1000
GROUP BY 1;

SELECT
    wp.pageview_url AS landing_page, -- 'ENTRY PAGE'
    COUNT(DISTINCT temp_fpv.website_session_id) AS sessions_hitting_this_lander
FROM temp_first_page_view AS temp_fpv
    LEFT JOIN website_pageviews AS wp
        ON temp_fpv.min_pv_id = wp.website_pageview_id
GROUP BY 1;

