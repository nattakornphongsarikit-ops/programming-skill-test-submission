# Question 2 AI Workflow Demo

โปรเจกต์ย่อยนี้ใช้โชว์ข้อ 2.2 ตอนสัมภาษณ์: ให้ AI อ่าน requirement และสร้าง code ให้ดูสด

## Files

- `DEMO_CHAT_PROMPT.md`: ข้อความแบบธรรมชาติสำหรับ copy ไปเปิด new chat
- `FRONTEND_FOLLOWUP_PROMPT.md`: ข้อความ follow-up สำหรับเพิ่มหน้า frontend ในแชทเดิม
- `generated-aspnet-solution/`: code ที่ AI สร้างจาก prompt

## Demo steps

1. เปิด new chat ใน AI/Codex
2. ส่งข้อความจาก `DEMO_CHAT_PROMPT.md`
3. ให้ AI สรุป requirement ก่อนเขียน code
4. ให้ AI สร้าง ASP.NET Core API endpoint `POST /reservations` พร้อม test
5. ส่งข้อความจาก `FRONTEND_FOLLOWUP_PROMPT.md` เพื่อให้ AI เพิ่มหน้า frontend ต่อในแชทเดิม
6. เปิด test result และหน้า frontend ให้กรรมการดู

## คำพูดสั้น ๆ ตอนอธิบาย

ผมไม่ได้สั่ง AI แค่ "เขียน code ให้หน่อย" แต่เขียน prompt ให้มี requirement, scope, rule, test case และ output folder ชัดเจน เพื่อให้ AI ทำ API ที่ test ได้จริง
