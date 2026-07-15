using RestaurantBooking.Api.Contracts;

namespace RestaurantBooking.Api.Services;

public sealed class ReservationService : IReservationService
{
    private const decimal MinimumWindowDeposit = 1000m;

    public ReservationApiResponse Check(ReservationRequest request)
    {
        if (request.TableType == TableType.Regular)
        {
            return Approved();
        }

        if (!IsMondayToThursday(request.ReservationDate))
        {
            return Rejected(
                "WINDOW_TABLE_DAY_NOT_ALLOWED",
                "โต๊ะริมหน้าต่างจองได้เฉพาะวันจันทร์ถึงวันพฤหัสบดี");
        }

        if (request.Deposit < MinimumWindowDeposit)
        {
            return Rejected(
                "WINDOW_TABLE_DEPOSIT_TOO_LOW",
                "โต๊ะริมหน้าต่างต้องมัดจำอย่างน้อย 1,000 บาท");
        }

        return Approved();
    }

    private static bool IsMondayToThursday(DateOnly date)
    {
        return date.DayOfWeek is >= DayOfWeek.Monday and <= DayOfWeek.Thursday;
    }

    private static ReservationApiResponse Approved()
    {
        return new ReservationApiResponse(true, "BOOKING_APPROVED", "จองโต๊ะสำเร็จ");
    }

    private static ReservationApiResponse Rejected(string code, string message)
    {
        return new ReservationApiResponse(false, code, message);
    }
}
