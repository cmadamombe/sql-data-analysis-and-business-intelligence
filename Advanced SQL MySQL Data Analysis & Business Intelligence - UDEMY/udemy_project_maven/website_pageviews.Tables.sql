--
-- Create table `website_pageviews`
--
CREATE TABLE website_pageviews (
  website_pageview_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  pageview_url VARCHAR(50) NOT NULL,
  PRIMARY KEY (website_pageview_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1188125,
AVG_ROW_LENGTH = 56,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `website_pageviews_website_session_id` on table `website_pageviews`
--
ALTER TABLE website_pageviews 
  ADD INDEX website_pageviews_website_session_id(website_session_id);