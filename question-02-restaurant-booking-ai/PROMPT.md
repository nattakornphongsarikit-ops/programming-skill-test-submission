# Main Prompt for AI

ผมต้องการใช้ AI ช่วยสร้าง code สำหรับระบบจองโต๊ะร้านอาหาร แต่รอบนี้อยากให้ทำเป็น C# ASP.NET Core API 

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
- ช่วงแรกยังไม่ต้องทำ frontend ให้ทำ API ให้เสร็จก่อน
- ห้ามเปลี่ยน business rule
- ห้ามเพิ่ม feature เกินโจทย์
- response message เป็นภาษาไทย
- ต้องมี boundary test สำหรับวันพฤหัสบดี/วันศุกร์
- ต้องมี boundary test สำหรับมัดจำ 999/1000

ช่วยสร้างไฟล์ไว้ใน:

`question-02-restaurant-booking-ai/generated-aspnet-solution/`

## Frontend Follow-up Prompt

หลังจาก API เสร็จแล้ว ให้ส่งข้อความนี้ต่อในแชทเดิม:

```text
ขอเพิ่มอีกนิดครับ

จาก API ที่ทำไว้ ช่วยเพิ่มหน้า frontend สำหรับทดลองจองโต๊ะให้ด้วย

ไม่ต้องทำระบบใหญ่ ขอเป็นหน้าเว็บเรียบง่ายสำหรับ demo ตอนสัมภาษณ์ก็พอ

สิ่งที่อยากได้:

- มี form ให้กรอกวันที่จอง
- เลือกประเภทโต๊ะ `regular` หรือ `window`
- กรอกยอดมัดจำ
- กด submit แล้วเรียก API `POST /reservations`
- แสดงผลลัพธ์จาก API ให้ผู้ใช้เห็น
- ถ้าผ่านให้แสดงข้อความสำเร็จ
- ถ้าไม่ผ่านให้แสดง reason จาก API

ข้อจำกัด:

- ไม่ต้องทำ login
- ไม่ต้องทำ database
- ไม่ต้องใช้ frontend framework
- ใช้ HTML/CSS/JavaScript ธรรมดาได้
- อย่าเปลี่ยน business rule เดิม
- API logic เดิมต้องเป็นตัวตัดสินผลลัพธ์ ไม่ใช่ให้ frontend ตัดสินแทน

ช่วยสร้าง frontend ไว้ใน solution เดิม:

`question-02-restaurant-booking-ai/generated-aspnet-solution/`

และช่วยบอกวิธี run + วิธีทดสอบสั้น ๆ ด้วยครับ
```
