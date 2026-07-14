# Restaurant Table Booking API Requirements

ผมอยากได้ API สำหรับตรวจสอบว่า request การจองโต๊ะผ่านเงื่อนไขหรือไม่

## API

ให้สร้าง endpoint:

```http
POST /reservations
Content-Type: application/json
```

## Request Body

```json
{
  "reservationDate": "2026-07-16",
  "tableType": "window",
  "deposit": 1000
}
```

## Field rules

- `reservationDate` ต้องเป็น string รูปแบบ `YYYY-MM-DD`
- `reservationDate` ต้องเป็นวันที่จริง
- `tableType` รับได้แค่ `window` หรือ `regular`
- `deposit` ต้องเป็นตัวเลข
- `deposit` ต้องไม่ติดลบ

## Business rules

1. โต๊ะริมหน้าต่าง (`window`) จองได้เฉพาะวันจันทร์ถึงวันพฤหัสบดี
2. โต๊ะริมหน้าต่างต้องมัดจำอย่างน้อย 1,000 บาท
3. โต๊ะทั่วไป (`regular`) จองได้ทุกวัน
4. โต๊ะทั่วไปไม่มีขั้นต่ำมัดจำ
5. การเช็กวันต้องไม่พังเพราะ timezone

## Success response

HTTP 200

```json
{
  "success": true,
  "code": "BOOKING_APPROVED",
  "message": "จองโต๊ะสำเร็จ"
}
```

## Error response

HTTP 400

```json
{
  "success": false,
  "code": "ERROR_CODE",
  "message": "เหตุผลที่ไม่สามารถจองได้"
}
```

## Acceptance criteria

- วันจันทร์ + `window` + `1000` = ผ่าน
- วันพฤหัสบดี + `window` + `1000` = ผ่าน
- วันศุกร์ + `window` + `1000` = ไม่ผ่าน
- วันจันทร์ + `window` + `999` = ไม่ผ่าน
- วันเสาร์ + `regular` + `0` = ผ่าน
- วันที่ผิด = ไม่ผ่าน
- table type ผิด = ไม่ผ่าน
- deposit ติดลบ = ไม่ผ่าน
