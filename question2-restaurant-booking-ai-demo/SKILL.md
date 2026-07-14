# AI Development Skill

ใช้ Workflow นี้ทุกครั้ง

## Step 1: Analyze

- แยก Input Validation
- แยก Business Rules
- หา Boundary Cases
- ตรวจ Requirement ที่อาจกำกวม

## Step 2: Design

- ออกแบบ `reserveTable(input)`
- แยก Helper Function
- กำหนด Error Code
- วางแผนป้องกัน Timezone Bug

## Step 3: Implement

- เขียน Code ที่อ่านง่าย
- ใช้ Early Return
- ไม่เพิ่ม Feature เกิน Scope

## Step 4: Test

ต้องทดสอบอย่างน้อย:

- Happy Path
- วันพฤหัสบดีเทียบกับวันศุกร์
- มัดจำ 999 เทียบกับ 1000
- Invalid Date
- Invalid Table Type
- Invalid Deposit

## Step 5: Self Review

ตรวจว่า:

- Code ตรงตาม Requirement
- ไม่มี Scope Creep
- ทุก Business Rule มี Test
- Error Message และ Error Code สอดคล้องกัน
