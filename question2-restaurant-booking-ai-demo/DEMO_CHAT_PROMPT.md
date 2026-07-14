# Demo Chat Prompt

ช่วยทำข้อ 2.2 ให้หน่อยครับ

โจทย์คือให้เขียน prompt เพื่อสั่ง AI เขียน code ฟังก์ชันจองโต๊ะร้านอาหาร

ผมเตรียมไฟล์ไว้ในโฟลเดอร์ `question2-restaurant-booking-ai-demo/` แล้ว:

- `AGENTS.md`
- `REQUIREMENTS.md`
- `SKILL.md`
- `PROMPT.md`

ช่วยอ่านไฟล์พวกนี้ก่อน แล้วสรุปให้ผมก่อนว่าคุณเข้าใจ requirement ว่ายังไง

หลังจากนั้นช่วยสร้างฟังก์ชัน `reserveTable(input)` ด้วย JavaScript ตามโจทย์ โดยขอให้:

- แยก validation ออกจาก business logic
- ไม่ทำ UI, API หรือ database
- ไม่ใช้ library ภายนอก
- กันปัญหา timezone จากวันที่
- เขียน test ด้วย `node:test`
- มี test case สำหรับวันพฤหัส/วันศุกร์ และมัดจำ 999/1000

ช่วยสร้างไฟล์ code และ test ไว้ใน:

`question2-restaurant-booking-ai-demo/generated-solution/`

แล้วรัน test ให้ดูด้วยครับ
