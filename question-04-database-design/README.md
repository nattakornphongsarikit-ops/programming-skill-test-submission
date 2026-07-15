# Question 4 - Database Design

ออกแบบฐานข้อมูลระบบการเรียนการสอน

## Files

- `database_er_diagram.svg`: ER diagram แบบง่าย
- `database_er_diagram.md`: ER diagram แบบ Mermaid
- `database_design.sql`: SQL Server DDL ตามโจทย์
- `teaching_system_mysql.sql`: MySQL script ที่ใช้สร้างฐานจริงบน server
- `database_index_notes.md`: เหตุผลของ index แต่ละตัว

## Live Database

Database บน server:

```text
teaching_system
```

ตารางหลัก:

```text
Students
Teachers
Courses
Enrollments
TeachingSessions
Attendances
```

