--
-- Create table `orders`
--
CREATE TABLE orders (
  order_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  website_session_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  primary_product_id SMALLINT UNSIGNED NOT NULL,
  items_purchased SMALLINT UNSIGNED NOT NULL,
  price_usd DECIMAL(6, 2) NOT NULL,
  cogs_usd DECIMAL(6, 2) NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 32314,
AVG_ROW_LENGTH = 81,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `orders_website_session_id` on table `orders`
--
ALTER TABLE orders 
  ADD INDEX orders_website_session_id(website_session_id);