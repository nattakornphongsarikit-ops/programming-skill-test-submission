USE customer_cursor_demo;

DROP PROCEDURE IF EXISTS sp_show_customers_cursor;

DELIMITER $$

CREATE PROCEDURE sp_show_customers_cursor()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE vCustomerName VARCHAR(50);
  DECLARE vCity VARCHAR(50);

  DECLARE customer_cursor CURSOR FOR
    SELECT CustomerName, City
    FROM tbCustomers
    ORDER BY CustomerId;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DROP TEMPORARY TABLE IF EXISTS cursor_result;
  CREATE TEMPORARY TABLE cursor_result (
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    ResultText VARCHAR(120)
  );

  OPEN customer_cursor;

  read_loop: LOOP
    FETCH customer_cursor INTO vCustomerName, vCity;

    IF done = 1 THEN
      LEAVE read_loop;
    END IF;

    INSERT INTO cursor_result (CustomerName, City, ResultText)
    VALUES (vCustomerName, vCity, CONCAT(vCustomerName, ' | ', vCity));
  END LOOP;

  CLOSE customer_cursor;

  SELECT ResultText
  FROM cursor_result;
END$$

DELIMITER ;

CALL sp_show_customers_cursor();
