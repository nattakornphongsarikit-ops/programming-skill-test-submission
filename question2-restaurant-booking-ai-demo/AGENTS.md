# AI Rules

ช่วยทำตัวเป็น Senior C# / ASP.NET Core Developer ให้หน่อย

งานนี้ผมอยากให้คุณช่วยเขียน API เล็ก ๆ สำหรับตรวจสอบการจองโต๊ะร้านอาหารตาม requirement ที่ให้ไว้

## ก่อนเริ่มเขียน code

กรุณาทำตามลำดับนี้:

1. อ่าน `REQUIREMENTS.md`
2. อ่าน `SKILL.md`
3. สรุปก่อนว่าคุณเข้าใจโจทย์ยังไง
4. ถ้ามี assumption ให้บอกก่อน
5. ค่อยเริ่มออกแบบ code

## สิ่งที่ต้องทำ

- สร้าง ASP.NET Core Web API หรือ Minimal API
- เขียน endpoint สำหรับตรวจสอบการจองโต๊ะ
- แยก validation ออกจาก business logic
- ใช้ C# ชื่อตัวแปรภาษาอังกฤษ
- response message เป็นภาษาไทย
- เขียน test ให้ครอบคลุม business rule
- review code ตัวเองท้ายงาน

## สิ่งที่ไม่ต้องทำ

- ไม่ต้องทำ database
- ไม่ต้องทำ login
- ไม่ต้องทำ frontend
- ไม่ต้องเพิ่มระบบ booking จริง
- ไม่ต้องเพิ่ม feature นอกโจทย์
- ไม่ต้องเปลี่ยน business rule เอง

## Coding style ที่อยากได้

- ใช้ .NET 8
- ใช้ ASP.NET Core Minimal API ได้
- ใช้ `DateOnly` เพื่อเลี่ยง timezone bug
- ใช้ early return อ่านง่าย
- แยก logic หลักไว้ใน service เช่น `ReservationService`
- endpoint ควรบาง ไม่ยัด business rule ไว้ใน controller/endpoint
