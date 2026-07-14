# ASP.NET Core API Bonus

ตัวอย่างนี้เป็นเวอร์ชัน C# ASP.NET Core API ของโจทย์ข้อ 2

## Run

ต้องมี .NET 8 SDK ก่อน

```powershell
cd "D:\git\programming-skill-test-submission\question2-restaurant-booking-ai-demo\aspnet-core-api"
dotnet run
```

## Test with curl

```bash
curl -X POST http://localhost:5000/reservations \
  -H "Content-Type: application/json" \
  -d "{\"reservationDate\":\"2026-07-16\",\"tableType\":\"window\",\"deposit\":1000}"
```

## API

`POST /reservations`

Input:

```json
{
  "reservationDate": "2026-07-16",
  "tableType": "window",
  "deposit": 1000
}
```

Success:

```json
{
  "success": true,
  "code": "BOOKING_APPROVED",
  "message": "จองโต๊ะสำเร็จ"
}
```

## Interview explanation

ผมแยก logic ไว้ใน `ReservationService.ReserveTable()` เพื่อให้ business rule ไม่ผูกกับ HTTP endpoint

API layer มีหน้าที่รับ request และแปลงผลลัพธ์เป็น HTTP response เท่านั้น

ผมใช้ `DateOnly` แทน `DateTime` เพื่อหลีกเลี่ยง timezone bug เพราะ requirement ต้องการเช็กแค่วัน ไม่ต้องใช้เวลา
