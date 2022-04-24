-- STEP 1: FIND THE FIRST PAGE VIEW FOR EACH SESSION
-- STEP 2: FIND THE URL THE CUSTOMER SAW ON THAT FIRST PAGE VIEW
CREATE TEMPORARY TABLE first_page_view_session
SELECT
    wp.website_session_id, -- each session
    MIN(wp.website_pageview_id) first_page_view -- first page viewed
FROM website_pageviews wp
WHERE wp.created_at < '2012-06-12'
GROUP BY wp.website_session_id
;

SELECT 
    wp.pageview_url landing_page, -- top entry page/first page seen
    COUNT(DISTINCT fpvs.website_session_id) number_of_sessions_hitting_this_page
FROM first_page_view_session fpvs 
    LEFT JOIN website_pageviews wp
        ON fpvs.first_page_view = wp.website_pageview_id
GROUP BY landing_page
;