# Programming Skill Test Submission

รวมคำตอบ Programming Skill Test โดยแยกโฟลเดอร์ตามข้อ และเก็บในแต่ละข้อให้เห็นไฟล์ code/script เป็นหลัก

## Project Structure

| Folder | Content |
| --- | --- |
| `question-01-responsive-form/` | HTML/CSS/JavaScript responsive register form |
| `question-02-restaurant-booking-ai/` | AI prompt files, ASP.NET Core API source, and frontend |
| `question-03-pattern-output/` | JavaScript pattern logic with browser demo and CLI runner |
| `question-04-database-design/` | ER diagram image, database DDL, and live MySQL script |
| `question-05-sql-cursor/` | SQL Server cursor answer and MySQL cursor demo |

## Important Files

- `index.html`: landing page for live demo links
- `question-01-responsive-form/index.html`: open directly in browser
- `question-03-pattern-output/index.html`: browser demo for pattern output
- `question-04-database-design/database_er_diagram.svg`: simple ER diagram
- `question-04-database-design/database_design.sql`: SQL Server DDL
- `question-04-database-design/teaching_system_mysql.sql`: MySQL script used on server
- `question-05-sql-cursor/cursor_loop.sql`: SQL Server cursor answer

## How to Run

Open question 1:

```text
question-01-responsive-form/index.html
```

Run question 3 with Node.js:

```bash
node question-03-pattern-output/pattern-cli.js 1 4 3
```

Run question 5 on MySQL demo:

```sql
CALL sp_show_customers_cursor();
```

## Live Demo

- Main page: http://122.155.174.34:8081/
- Question 1: http://122.155.174.34:8081/question-01-responsive-form/
- Question 2 frontend/API: http://122.155.174.34:8082/
- Question 3: http://122.155.174.34:8081/question-03-pattern-output/
- phpMyAdmin: http://122.155.174.34:8083/
