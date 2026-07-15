# Question 5 - SQL Cursor Looping

โจทย์ให้ใช้ cursor loop ข้อมูลลูกค้า แล้วแสดง `CustomerName` และ `City`

## Files

- `cursor_loop.sql`: คำตอบแบบ SQL Server/T-SQL ตามโจทย์
- `customer_cursor_mysql_setup.sql`: สร้างฐานและข้อมูลตัวอย่างบน MySQL
- `customer_cursor_mysql_procedure.sql`: Stored Procedure แบบ MySQL ที่ใช้ cursor จริง

## Run On MySQL Demo

```sql
USE customer_cursor_demo;
CALL sp_show_customers_cursor();
```

