BEGIN
    DECLARE @tbCustomers TABLE
    (
        CustomerId INT,
        CustomerName VARCHAR(50),
        City VARCHAR(50)
    );

    INSERT INTO @tbCustomers (CustomerId, CustomerName, City) VALUES
        (1, 'Alfreds Futterkiste', 'Berlin'),
        (2, 'Around the Horn', 'London'),
        (3, 'Blondel père et fils', 'Strasbourg'),
        (4, 'Consolidated Holdings', 'London'),
        (5, 'Eastern Connection', 'London'),
        (6, 'Paris spécialités', 'Paris');

    DECLARE
        @CustomerName VARCHAR(50),
        @City VARCHAR(50);

    DECLARE customer_cursor CURSOR LOCAL FAST_FORWARD FOR
        SELECT CustomerName, City
        FROM @tbCustomers
        ORDER BY CustomerId;

    OPEN customer_cursor;

    FETCH NEXT FROM customer_cursor INTO @CustomerName, @City;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT CONCAT(@CustomerName, ' | ', @City);

        FETCH NEXT FROM customer_cursor INTO @CustomerName, @City;
    END;

    CLOSE customer_cursor;
    DEALLOCATE customer_cursor;
END;
