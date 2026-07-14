# Question 2 AI Workflow Demo

โปรเจกต์ย่อยนี้ใช้โชว์ข้อ 2.2 ตอนสัมภาษณ์: ให้ AI อ่าน requirement และสร้าง code ให้ดูสด

## Files

- `AGENTS.md`: กำหนดบทบาทและกฎของ AI
- `REQUIREMENTS.md`: business rules ของการจองโต๊ะ
- `SKILL.md`: workflow สำหรับวิเคราะห์ ออกแบบ เขียน test และ review
- `PROMPT.md`: prompt หลักที่ใช้ส่งให้ AI
- `DEMO_CHAT_PROMPT.md`: ข้อความแบบธรรมชาติสำหรับ copy ไปเปิด new chat
- `FRONTEND_FOLLOWUP_PROMPT.md`: ข้อความ follow-up สำหรับเพิ่มหน้า frontend ในแชทเดิม
- `aspnet-core-api/`: ตัวอย่าง C# ASP.NET Core API ที่ทำไว้ให้ดู

## Demo steps

1. เปิด new chat ใน AI/Codex
2. แนบหรือเปิดไฟล์ 4 ไฟล์นี้ให้ AI อ่าน
3. ส่งข้อความจาก `DEMO_CHAT_PROMPT.md`
4. ให้ AI สรุป requirement ก่อนเขียน code
5. ให้ AI สร้าง ASP.NET Core API endpoint `POST /reservations` พร้อม test
6. ส่งข้อความจาก `FRONTEND_FOLLOWUP_PROMPT.md` เพื่อให้ AI เพิ่มหน้า frontend ต่อในแชทเดิม
7. เปิด test result และหน้า frontend ให้กรรมการดู

## คำพูดสั้น ๆ ตอนอธิบาย

ผมไม่ได้สั่ง AI แค่ "เขียน code ให้หน่อย" แต่ผมแยก requirement, rule ของ AI, workflow, และ prompt หลักออกเป็นไฟล์ เพื่อควบคุม scope และให้ AI ทำ API ที่ test ได้จริง
