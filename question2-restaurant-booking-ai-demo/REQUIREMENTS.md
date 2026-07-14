# Restaurant Table Booking Requirements

## Input

```js
{
  reservationDate: "2026-07-16",
  tableType: "window",
  deposit: 1000
}
```

## Business Rules

1. โต๊ะริมหน้าต่าง (`window`) จองได้เฉพาะวันจันทร์-พฤหัสบดี
2. โต๊ะริมหน้าต่างต้องมัดจำตั้งแต่ 1,000 บาทขึ้นไป
3. โต๊ะทั่วไป (`regular`) จองได้ทุกวันและไม่มีขั้นต่ำมัดจำ
4. วันที่ต้องเป็นรูปแบบ `YYYY-MM-DD` และเป็นวันที่จริง
5. `tableType` ต้องเป็น `window` หรือ `regular`
6. `deposit` ต้องเป็นตัวเลขและต้องไม่ติดลบ

## Expected Output

สำเร็จ:

```js
{
  success: true,
  code: "BOOKING_APPROVED",
  message: "จองโต๊ะสำเร็จ"
}
```

ไม่สำเร็จ:

```js
{
  success: false,
  code: "ERROR_CODE",
  message: "เหตุผลที่ไม่สามารถจองได้"
}
```

## Acceptance Criteria

- วันจันทร์ + window + 1000 = ผ่าน
- วันพฤหัสบดี + window + 1000 = ผ่าน
- วันศุกร์ + window + 1000 = ไม่ผ่าน
- วันจันทร์ + window + 999 = ไม่ผ่าน
- วันเสาร์ + regular + 0 = ผ่าน
- วันที่ผิด, ประเภทโต๊ะผิด, มัดจำติดลบ = ไม่ผ่าน
