--
-- Create table `products`
--
CREATE TABLE products (
  product_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at DATETIME NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (product_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;