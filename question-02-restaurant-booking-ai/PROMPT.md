# Main Prompt for AI

ช่วยทำข้อ 2.2 ให้หน่อยครับ

ผมต้องการใช้ AI ช่วยสร้าง code สำหรับระบบจองโต๊ะร้านอาหาร แต่รอบนี้อยากให้ทำเป็น C# ASP.NET Core API ไม่ใช่ JavaScript

ก่อนเขียน code ช่วยอ่านไฟล์พวกนี้ก่อน:

- `AGENTS.md`
- `REQUIREMENTS.md`
- `SKILL.md`

หลังอ่านแล้วช่วยทำตามนี้:

1. สรุป requirement ที่คุณเข้าใจแบบสั้น ๆ
2. บอก assumption ถ้ามี
3. อธิบาย plan ว่าจะเขียน API ยังไง
4. สร้าง ASP.NET Core Minimal API
5. สร้าง endpoint `POST /reservations`
6. แยก validation และ business logic ออกจาก endpoint
7. ใช้ `DateOnly` เพื่อกัน timezone bug
8. เขียน automated tests ให้ครอบคลุมเงื่อนไขสำคัญ
9. รัน test แล้วสรุปผล
10. review code ตัวเองว่ามีจุดเสี่ยงอะไรไหม

ข้อกำหนดสำคัญ:

- ห้ามทำ database
- ห้ามทำ frontend
- ห้ามเปลี่ยน business rule
- ห้ามเพิ่ม feature เกินโจทย์
- response message เป็นภาษาไทย
- ต้องมี boundary test สำหรับวันพฤหัสบดี/วันศุกร์
- ต้องมี boundary test สำหรับมัดจำ 999/1000

ช่วยสร้างไฟล์ไว้ใน:

`question-02-restaurant-booking-ai/generated-aspnet-solution/`
