# Demo Chat Prompt

ช่วยทำข้อ 2.2 ให้หน่อยครับ

โจทย์คือให้เขียน prompt เพื่อสั่ง AI เขียน code ฟังก์ชันจองโต๊ะร้านอาหาร

ผมอยากทำให้ดูจริงจังกว่าฟังก์ชันธรรมดา เลยอยากให้ทำเป็น C# ASP.NET Core API เล็ก ๆ แทน

ช่วยสรุป requirement ให้ผมก่อนว่าคุณเข้าใจโจทย์ยังไง แล้วค่อยสร้าง API ตามนี้:

- ใช้ C# ASP.NET Core Minimal API
- มี endpoint `POST /reservations`
- request body มี `customerName`, `tableType`, `reservationDate`, `depositAmount`
- `tableType` มี `regular` และ `window`
- โต๊ะทั่วไปจองได้ตามปกติ
- โต๊ะริมหน้าต่างจองได้เฉพาะวันจันทร์ถึงวันพฤหัสบดี
- โต๊ะริมหน้าต่างต้องมียอดมัดจำตั้งแต่ 1,000 บาทขึ้นไป
- ถ้าจองไม่ได้ ให้ตอบเหตุผลแบบอ่านง่าย
- แยก validation ออกจาก business logic
- แยก logic หลักไว้ใน service เพื่อให้ test ได้ง่าย
- ไม่ทำ database
- กันปัญหา timezone ด้วย `DateOnly`
- เขียน automated tests
- มี test case สำหรับวันพฤหัส/วันศุกร์ และมัดจำ 999/1000

ช่วยสร้างไฟล์ code และ test ไว้ใน:

`question-02-restaurant-booking-ai/generated-aspnet-solution/`

แล้วรัน test ให้ดูด้วยครับ
