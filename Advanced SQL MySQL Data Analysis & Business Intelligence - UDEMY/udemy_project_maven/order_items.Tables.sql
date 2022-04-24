--
-- Create table `order_items`
--
CREATE TABLE order_items (
  order_item_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  product_id SMALLINT UNSIGNED NOT NULL,
  is_primary_item SMALLINT UNSIGNED NOT NULL,
  price_usd DECIMAL(6, 2) NOT NULL,
  cogs_usd DECIMAL(6, 2) NOT NULL,
  PRIMARY KEY (order_item_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 40026,
AVG_ROW_LENGTH = 65,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `order_items_order_id` on table `order_items`
--
ALTER TABLE order_items 
  ADD INDEX order_items_order_id(order_id);