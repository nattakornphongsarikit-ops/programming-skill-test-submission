using RestaurantBooking.Api.Contracts;

namespace RestaurantBooking.Api.Validation;

public sealed record ReservationValidationResult(
    bool IsValid,
    ReservationRequest Request,
    ReservationApiResponse Error)
{
    public static ReservationValidationResult Success(ReservationRequest request)
    {
        return new ReservationValidationResult(true, request, EmptyError());
    }

    public static ReservationValidationResult Failure(string code, string message)
    {
        return new ReservationValidationResult(
            false,
            EmptyRequest(),
            new ReservationApiResponse(false, code, message));
    }

    private static ReservationRequest EmptyRequest()
    {
        return new ReservationRequest(default, default, default);
    }

    private static ReservationApiResponse EmptyError()
    {
        return new ReservationApiResponse(false, string.Empty, string.Empty);
    }
}
