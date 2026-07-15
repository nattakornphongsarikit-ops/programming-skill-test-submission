CREATE DATABASE IF NOT EXISTS customer_cursor_demo
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE customer_cursor_demo;

CREATE TABLE IF NOT EXISTS tbCustomers (
  CustomerId INT PRIMARY KEY COMMENT 'รหัสลูกค้า',
  CustomerName VARCHAR(50) NOT NULL COMMENT 'ชื่อลูกค้า',
  City VARCHAR(50) NOT NULL COMMENT 'เมือง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ข้อมูลลูกค้าสำหรับทดสอบ cursor';

INSERT INTO tbCustomers (CustomerId, CustomerName, City) VALUES
  (1, 'Alfreds Futterkiste', 'Berlin'),
  (2, 'Around the Horn', 'London'),
  (3, 'Blondel père et fils', 'Strasbourg'),
  (4, 'Consolidated Holdings', 'London'),
  (5, 'Eastern Connection', 'London'),
  (6, 'Paris spécialités', 'Paris')
ON DUPLICATE KEY UPDATE
  CustomerName = VALUES(CustomerName),
  City = VALUES(City);
