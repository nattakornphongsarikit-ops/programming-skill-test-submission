# Demo Chat Prompt

ช่วยทำข้อ 2.2 ให้หน่อยครับ

โจทย์คือให้เขียน prompt เพื่อสั่ง AI เขียน code ฟังก์ชันจองโต๊ะร้านอาหาร

ผมอยากทำให้ดูจริงจังกว่าฟังก์ชันธรรมดา เลยอยากให้ทำเป็น C# ASP.NET Core API เล็ก ๆ แทน

ผมเตรียมไฟล์ไว้ในโฟลเดอร์ `question2-restaurant-booking-ai-demo/` แล้ว:

- `AGENTS.md`
- `REQUIREMENTS.md`
- `SKILL.md`
- `PROMPT.md`

ช่วยอ่านไฟล์พวกนี้ก่อน แล้วสรุปให้ผมก่อนว่าคุณเข้าใจ requirement ยังไง

หลังจากนั้นช่วยสร้าง API ตามโจทย์ โดยขอให้:

- ใช้ C# ASP.NET Core Minimal API
- มี endpoint `POST /reservations`
- แยก validation ออกจาก business logic
- แยก logic หลักไว้ใน service
- ไม่ทำ database
- ไม่ทำ frontend
- กันปัญหา timezone ด้วย `DateOnly`
- เขียน automated tests
- มี test case สำหรับวันพฤหัส/วันศุกร์ และมัดจำ 999/1000

ช่วยสร้างไฟล์ code และ test ไว้ใน:

`question2-restaurant-booking-ai-demo/generated-aspnet-solution/`

แล้วรัน test ให้ดูด้วยครับ
