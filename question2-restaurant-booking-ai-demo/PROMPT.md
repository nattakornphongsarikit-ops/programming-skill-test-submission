# Main Prompt for AI

อ่านไฟล์ต่อไปนี้ก่อนเริ่มงาน:

- `AGENTS.md`
- `REQUIREMENTS.md`
- `SKILL.md`

จากนั้นสร้างฟังก์ชัน `reserveTable(input)` ด้วย JavaScript

ให้ทำงานตามลำดับ:

1. สรุป Requirement ที่เข้าใจ
2. ระบุ Assumptions
3. อธิบายแผนการเขียน Code
4. เขียน Source Code
5. เขียน Automated Tests ด้วย `node:test`
6. แสดงผล Test ที่คาดหวัง
7. Review Code ของตัวเอง
8. สรุปความเสี่ยงหรือ Edge Cases ที่พบ

ข้อกำหนดสำคัญ:

- ห้ามเปลี่ยน Business Rule
- ห้ามเพิ่ม Database, API หรือ UI
- ห้ามใช้ Library ภายนอก
- ต้องแยก Validation ออกจาก Business Logic
- ต้องป้องกัน Timezone Bug
- ต้องมี Boundary Test สำหรับวันพฤหัสบดี/วันศุกร์ และมัดจำ 999/1000
