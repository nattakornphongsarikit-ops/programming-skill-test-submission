# AI Development Skill

ใช้ workflow นี้ตอนทำงานให้ผม

## Step 1: Analyze

ก่อนเขียน code ให้แยกให้ชัด:

- input validation มีอะไรบ้าง
- business rule มีอะไรบ้าง
- edge case สำคัญคืออะไร
- จุดไหนเกี่ยวกับ boundary เช่น วันพฤหัส/วันศุกร์ และ 999/1000

## Step 2: Design

ออกแบบแบบนี้:

- endpoint รับ request อย่างเดียว
- service เป็นคนตัดสินว่าอนุมัติหรือไม่
- validation แยกเป็น helper หรือ method แยก
- response ใช้ code และ message ที่ชัดเจน
- ใช้ `DateOnly` ไม่ใช้ `DateTime` ถ้าไม่จำเป็น

## Step 3: Implement

เขียน C# ให้เรียบง่าย:

- ใช้ ASP.NET Core Minimal API ได้
- ใช้ record สำหรับ request/response model
- ใช้ early return
- ห้ามเอา business logic ไปปนกับ HTTP layer เยอะเกินไป
- ห้ามเพิ่ม database หรือ feature อื่น

## Step 4: Test

ช่วยเขียน test ให้ครอบคลุมอย่างน้อย:

- regular table ผ่านทุกวัน
- window table วันจันทร์ผ่าน
- window table วันพฤหัสผ่าน
- window table วันศุกร์ไม่ผ่าน
- deposit 1000 ผ่าน
- deposit 999 ไม่ผ่าน
- invalid date
- invalid table type
- negative deposit

## Step 5: Self Review

ก่อนจบช่วย review ตัวเอง:

- code ตรง requirement ไหม
- validation แยกจาก business logic ไหม
- มี scope creep หรือไม่
- test ครอบคลุม rule สำคัญไหม
- timezone bug ยังมีโอกาสเกิดไหม
