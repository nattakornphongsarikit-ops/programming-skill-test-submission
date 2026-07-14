using System.Globalization;
using System.Text.Json;
using RestaurantBooking.Api.Contracts;

namespace RestaurantBooking.Api.Validation;

public sealed class ReservationRequestValidator : IReservationRequestValidator
{
    private const string ReservationDateFormat = "yyyy-MM-dd";

    public ReservationValidationResult Validate(JsonElement requestBody)
    {
        if (requestBody.ValueKind != JsonValueKind.Object)
        {
            return ReservationValidationResult.Failure(
                "INVALID_REQUEST",
                "ข้อมูลคำขอไม่ถูกต้อง");
        }

        if (!TryReadReservationDate(requestBody, out var reservationDate))
        {
            return ReservationValidationResult.Failure(
                "INVALID_DATE",
                "วันที่ต้องเป็นรูปแบบ YYYY-MM-DD และเป็นวันที่จริง");
        }

        if (!TryReadTableType(requestBody, out var tableType))
        {
            return ReservationValidationResult.Failure(
                "INVALID_TABLE_TYPE",
                "ประเภทโต๊ะต้องเป็น window หรือ regular");
        }

        if (!TryReadDeposit(requestBody, out var deposit))
        {
            return ReservationValidationResult.Failure(
                "INVALID_DEPOSIT",
                "มัดจำต้องเป็นตัวเลขและต้องไม่ติดลบ");
        }

        if (deposit < 0)
        {
            return ReservationValidationResult.Failure(
                "INVALID_DEPOSIT",
                "มัดจำต้องเป็นตัวเลขและต้องไม่ติดลบ");
        }

        var request = new ReservationRequest(reservationDate, tableType, deposit);
        return ReservationValidationResult.Success(request);
    }

    private static bool TryReadReservationDate(JsonElement requestBody, out DateOnly reservationDate)
    {
        reservationDate = default;

        if (!requestBody.TryGetProperty("reservationDate", out var dateElement) ||
            dateElement.ValueKind != JsonValueKind.String)
        {
            return false;
        }

        var dateText = dateElement.GetString();
        return DateOnly.TryParseExact(
            dateText,
            ReservationDateFormat,
            CultureInfo.InvariantCulture,
            DateTimeStyles.None,
            out reservationDate);
    }

    private static bool TryReadTableType(JsonElement requestBody, out TableType tableType)
    {
        tableType = default;

        if (!requestBody.TryGetProperty("tableType", out var tableTypeElement) ||
            tableTypeElement.ValueKind != JsonValueKind.String)
        {
            return false;
        }

        tableType = tableTypeElement.GetString() switch
        {
            "window" => TableType.Window,
            "regular" => TableType.Regular,
            _ => default
        };

        return tableTypeElement.GetString() is "window" or "regular";
    }

    private static bool TryReadDeposit(JsonElement requestBody, out decimal deposit)
    {
        deposit = default;

        return requestBody.TryGetProperty("deposit", out var depositElement) &&
               depositElement.ValueKind == JsonValueKind.Number &&
               depositElement.TryGetDecimal(out deposit);
    }
}
