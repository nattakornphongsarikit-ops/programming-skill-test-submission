# Question 2 AI Workflow Demo

โปรเจกต์ย่อยนี้ใช้โชว์ข้อ 2.2 ตอนสัมภาษณ์: ให้ AI อ่าน requirement และสร้าง code ให้ดูสด

## Files

- `AGENTS.md`: กำหนดบทบาทและกฎของ AI
- `REQUIREMENTS.md`: business rules ของการจองโต๊ะ
- `SKILL.md`: workflow สำหรับวิเคราะห์ ออกแบบ เขียน test และ review
- `PROMPT.md`: prompt หลักที่ใช้ส่งให้ AI

## Demo steps

1. เปิด new chat ใน AI/Codex
2. แนบหรือเปิดไฟล์ 4 ไฟล์นี้ให้ AI อ่าน
3. ส่งข้อความจาก `PROMPT.md`
4. ให้ AI สรุป requirement ก่อนเขียน code
5. ให้ AI สร้าง `reserveTable(input)` และ test ด้วย `node:test`
6. เปิด test result ให้กรรมการดู

## คำพูดสั้น ๆ ตอนอธิบาย

ผมไม่ได้สั่ง AI แค่ "เขียน code ให้หน่อย" แต่ผมแยก requirement, rule ของ AI, workflow, และ prompt หลักออกเป็นไฟล์ เพื่อควบคุม scope และทำให้ AI สร้าง code ที่ test ได้
