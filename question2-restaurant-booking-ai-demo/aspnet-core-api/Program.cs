using System.Globalization;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Ok(new
{
    service = "Restaurant Booking API",
    endpoint = "POST /reservations"
}));

app.MapPost("/reservations", (ReservationRequest request) =>
{
    var result = ReservationService.ReserveTable(request);
    return result.Success ? Results.Ok(result) : Results.BadRequest(result);
});

app.Run();

public sealed record ReservationRequest(
    string ReservationDate,
    string TableType,
    decimal Deposit);

public sealed record ReservationResult(
    bool Success,
    string Code,
    string Message);

public static class ReservationService
{
    private const decimal MinimumWindowDeposit = 1000m;

    public static ReservationResult ReserveTable(ReservationRequest input)
    {
        var validationError = ValidateInput(input);
        if (validationError is not null)
        {
            return validationError;
        }

        var reservationDate = DateOnly.ParseExact(
            input.ReservationDate,
            "yyyy-MM-dd",
            CultureInfo.InvariantCulture);

        if (input.TableType == "regular")
        {
            return Approved();
        }

        if (!IsMondayToThursday(reservationDate))
        {
            return Rejected(
                "WINDOW_TABLE_DAY_NOT_ALLOWED",
                "โต๊ะริมหน้าต่างจองได้เฉพาะวันจันทร์ถึงวันพฤหัสบดี");
        }

        if (input.Deposit < MinimumWindowDeposit)
        {
            return Rejected(
                "WINDOW_TABLE_DEPOSIT_TOO_LOW",
                "โต๊ะริมหน้าต่างต้องมัดจำอย่างน้อย 1,000 บาท");
        }

        return Approved();
    }

    private static ReservationResult? ValidateInput(ReservationRequest input)
    {
        if (!DateOnly.TryParseExact(
                input.ReservationDate,
                "yyyy-MM-dd",
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out _))
        {
            return Rejected("INVALID_DATE", "วันที่ต้องเป็นรูปแบบ YYYY-MM-DD และเป็นวันที่จริง");
        }

        if (input.TableType is not ("window" or "regular"))
        {
            return Rejected("INVALID_TABLE_TYPE", "ประเภทโต๊ะต้องเป็น window หรือ regular");
        }

        if (input.Deposit < 0)
        {
            return Rejected("INVALID_DEPOSIT", "มัดจำต้องเป็นตัวเลขและต้องไม่ติดลบ");
        }

        return null;
    }

    private static bool IsMondayToThursday(DateOnly date)
    {
        return date.DayOfWeek is >= DayOfWeek.Monday and <= DayOfWeek.Thursday;
    }

    private static ReservationResult Approved()
    {
        return new ReservationResult(true, "BOOKING_APPROVED", "จองโต๊ะสำเร็จ");
    }

    private static ReservationResult Rejected(string code, string message)
    {
        return new ReservationResult(false, code, message);
    }
}
