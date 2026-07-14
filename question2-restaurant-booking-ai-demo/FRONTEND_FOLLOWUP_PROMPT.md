# Frontend Follow-up Prompt

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

`question2-restaurant-booking-ai-demo/generated-aspnet-solution/`

และช่วยบอกวิธี run + วิธีทดสอบสั้น ๆ ด้วยครับ
