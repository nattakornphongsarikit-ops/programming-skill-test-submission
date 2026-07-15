# Programming Skill Tests - Answers

AI usage disclosure: ใช้ OpenAI Codex (GPT-5) ช่วยจัดทำคำตอบและตรวจโค้ด

## 1. Create a Responsive Form (HTML/CSS/JavaScript)

ส่งไฟล์ในโฟลเดอร์ `question-01-responsive-form/`

- `index.html`: โครงสร้างฟอร์ม Register
- `styles.css`: layout responsive, card, input, button, และ mobile breakpoint
- `script.js`: ตรวจ first name, last name, email, password ขั้นต่ำ 8 ตัวอักษร, และ confirm password

เปิดไฟล์ `question-01-responsive-form/index.html` ใน browser ได้ทันที

## 2. Logical and AI

สำหรับการโชว์ตอนสัมภาษณ์ ผมเตรียมโปรเจกต์ย่อยไว้ที่ `question-02-restaurant-booking-ai/` โดยแยกไฟล์ `AGENTS.md`, `REQUIREMENTS.md`, `SKILL.md`, และ `PROMPT.md` เพื่อให้เปิด new chat แล้วให้ AI ทำงานตาม requirement ได้จริง

### 2.1 แนวทางวิเคราะห์ code หรือ logic ตอนสัมภาษณ์

ถ้าได้รับ code จริง ผมจะไล่จาก input -> process -> output แล้วระบุจุดผิดหรือจุดเสี่ยงพร้อมผลกระทบ เช่น:

1. Input validation ไม่ครบ: ถ้าไม่ตรวจค่าว่าง, type, range, format หรือค่าที่เป็น null/undefined อาจทำให้ระบบ error หรือบันทึกข้อมูลผิด
2. Boundary condition ผิด: loop, index, วันที่, จำนวนเงิน, หรือจำนวนรายการ อาจพลาดกรณีค่าแรก/ค่าสุดท้าย เช่น off-by-one, array ว่าง, หรือ max/min
3. Business rule กระจายหลายจุด: ถ้าเงื่อนไขสำคัญไม่ได้รวมไว้ที่ function เดียว จะเกิด bug ง่ายเมื่อแก้ logic ในอนาคต
4. Security risk: ไม่ sanitize input, เก็บ password ไม่ปลอดภัย, หรือต่อ SQL string ตรง ๆ อาจทำให้เกิด injection หรือข้อมูลรั่ว
5. Error handling และ transaction ไม่ชัด: ถ้าทำหลายขั้นตอนแล้วบางขั้นตอน fail อาจเกิดข้อมูลค้างครึ่งเดียว และผู้ใช้ไม่รู้ว่าเกิดอะไรขึ้น

### 2.2 Prompt ให้ AI เขียน code ฟังก์ชันจองโต๊ะร้านอาหาร

```text
ช่วยเขียนฟังก์ชันสำหรับตรวจสอบการจองโต๊ะร้านอาหารด้วย JavaScript หรือ TypeScript

เงื่อนไขธุรกิจ:
1. ผู้ใช้สามารถจองโต๊ะทั่วไปได้ตามปกติ
2. ถ้าเลือกโต๊ะริมหน้าต่าง (window table) จะจองได้เฉพาะวันจันทร์ถึงวันพฤหัสบดีเท่านั้น
3. ถ้าเลือกโต๊ะริมหน้าต่าง ต้องมียอดมัดจำตั้งแต่ 1,000 บาทขึ้นไป
4. ถ้าไม่ผ่านเงื่อนไข ให้ return เหตุผลที่จองไม่ได้แบบอ่านง่าย
5. ให้แยก business logic เป็นฟังก์ชันที่ test ได้ และไม่ผูกกับ UI

ขอรูปแบบ function:
- input เป็น object เช่น { tableType, reservationDate, depositAmount }
- output เป็น object เช่น { allowed: boolean, reason?: string }

กรุณาเขียน code ที่อ่านง่าย พร้อมตัวอย่าง test cases อย่างน้อย 5 กรณี:
- โต๊ะทั่วไป
- โต๊ะริมหน้าต่างวันจันทร์และมัดจำครบ
- โต๊ะริมหน้าต่างวันศุกร์
- โต๊ะริมหน้าต่างวันพฤหัสแต่มัดจำไม่ครบ
- วันที่หรือยอดมัดจำไม่ถูกต้อง
```

ตัวอย่างคำตอบที่คาดหวังจาก AI:

```js
function canReserveTable({ tableType, reservationDate, depositAmount }) {
  const date = new Date(reservationDate);

  if (Number.isNaN(date.getTime())) {
    return { allowed: false, reason: "Invalid reservation date" };
  }

  if (typeof depositAmount !== "number" || depositAmount < 0) {
    return { allowed: false, reason: "Invalid deposit amount" };
  }

  if (tableType !== "window") {
    return { allowed: true };
  }

  const day = date.getDay(); // Sunday = 0, Monday = 1, ... Saturday = 6
  const isMondayToThursday = day >= 1 && day <= 4;

  if (!isMondayToThursday) {
    return {
      allowed: false,
      reason: "Window table can be reserved only Monday to Thursday",
    };
  }

  if (depositAmount < 1000) {
    return {
      allowed: false,
      reason: "Window table requires deposit of at least 1,000 THB",
    };
  }

  return { allowed: true };
}
```

## 3. การเขียนโปรแกรมแสดงผลลัพธ์

Logic: ในแต่ละรอบให้พิมพ์จาก 1 ถึงจำนวนสูงสุด แล้วถอยกลับจากจำนวนสูงสุด - 1 ถึง 1

```js
function buildPattern(character, maxCount, rounds) {
  const lines = [];

  for (let round = 0; round < rounds; round += 1) {
    for (let count = 1; count <= maxCount; count += 1) {
      lines.push(character.repeat(count));
    }

    for (let count = maxCount - 1; count >= 1; count -= 1) {
      lines.push(character.repeat(count));
    }
  }

  return lines;
}

console.log(buildPattern("1", 4, 3).join("\n"));
```

Output เมื่อ input คือ `1, 4, 3`:

```text
1
11
111
1111
111
11
1
1
11
111
1111
111
11
1
1
11
111
1111
111
11
1
```

## 4. SQL และการออกแบบฐานข้อมูล

แนวคิด relationship:

- Student กับ Course เป็น many-to-many ผ่าน `Enrollments`
- Teacher กับ Course เป็น one-to-one โดย `Courses.TeacherId` เป็น `UNIQUE`
- รายละเอียดการสอนเก็บที่ `TeachingSessions`
- การเข้าเรียนของนักเรียนเก็บที่ `Attendances`

| Table | Important Columns | Key / Relationship | Useful Index |
| --- | --- | --- | --- |
| `Students` | `StudentId`, `StudentCode`, `FirstName`, `LastName`, `Email`, `Phone` | PK: `StudentId`, Unique: `StudentCode` | `StudentCode` |
| `Teachers` | `TeacherId`, `TeacherCode`, `FirstName`, `LastName`, `Email`, `Phone` | PK: `TeacherId`, Unique: `TeacherCode` | `TeacherCode` |
| `Courses` | `CourseId`, `CourseCode`, `CourseName`, `TeacherId` | PK: `CourseId`, FK: `TeacherId`, Unique: `CourseCode`, `TeacherId` | `TeacherId` |
| `Enrollments` | `EnrollmentId`, `StudentId`, `CourseId`, `EnrolledAt`, `EnrollmentStatus` | PK: `EnrollmentId`, FK: `StudentId`, `CourseId`, Unique: `StudentId + CourseId` | `StudentId + CourseId`, `CourseId + EnrollmentStatus` |
| `TeachingSessions` | `SessionId`, `CourseId`, `TeacherId`, `SessionDate`, `StartTime`, `EndTime`, `Topic` | PK: `SessionId`, FK: `CourseId`, `TeacherId` | `CourseId + SessionDate`, `TeacherId + SessionDate` |
| `Attendances` | `AttendanceId`, `SessionId`, `StudentId`, `AttendanceStatus`, `CheckedAt` | PK: `AttendanceId`, FK: `SessionId`, `StudentId`, Unique: `SessionId + StudentId` | `StudentId`, `AttendanceStatus` |

ดู DDL เต็มได้ที่ `question-04-database-design/database_design.sql`
ดูเหตุผลของ index แต่ละตัวได้ที่ `question-04-database-design/database_index_notes.md`

## 5. SQL Cursor Looping

```sql
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
```

ดู script เต็มที่รวมการสร้าง `@tbCustomers` ได้ที่ `question-05-sql-cursor/cursor_loop.sql`
