USE ecommerce;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Uniquely identifies the Customer',
  `first_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'First name of the customer',
  `last_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Last name of the customer',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT 'Email of the customer',
  `date_created` DATETIME NOT NULL DEFAULT '2020-01-01 16:00:00' COMMENT 'When this record was created',
  `date_modified` TIMESTAMP NOT NULL COMMENT 'When this record was last updated',
  PRIMARY KEY (`customer_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to store customers';



