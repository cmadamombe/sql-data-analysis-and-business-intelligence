--
-- Create table `order_item_refunds`
--
CREATE TABLE order_item_refunds (
  order_item_refund_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  order_item_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  refund_amount_usd DECIMAL(6, 2) NOT NULL,
  PRIMARY KEY (order_item_refund_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1732,
AVG_ROW_LENGTH = 75,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `order_items_order_id` on table `order_item_refunds`
--
ALTER TABLE order_item_refunds 
  ADD INDEX order_items_order_id(order_id);

--
-- Create index `order_items_order_item_id` on table `order_item_refunds`
--
ALTER TABLE order_item_refunds 
  ADD INDEX order_items_order_item_id(order_item_id);