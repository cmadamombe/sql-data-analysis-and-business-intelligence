--
-- Create table `website_sessions`
--
CREATE TABLE website_sessions (
  website_session_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  is_repeat_session SMALLINT UNSIGNED NOT NULL,
  utm_source VARCHAR(12) DEFAULT NULL,
  utm_campaign VARCHAR(20) DEFAULT NULL,
  utm_content VARCHAR(15) DEFAULT NULL,
  device_type VARCHAR(15) DEFAULT NULL,
  http_referer VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (website_session_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 472872,
AVG_ROW_LENGTH = 99,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `website_sessions_user_id` on table `website_sessions`
--
ALTER TABLE website_sessions 
  ADD INDEX website_sessions_user_id(user_id);