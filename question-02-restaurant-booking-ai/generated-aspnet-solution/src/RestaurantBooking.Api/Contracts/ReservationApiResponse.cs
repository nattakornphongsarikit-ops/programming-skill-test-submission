namespace RestaurantBooking.Api.Contracts;

public sealed record ReservationApiResponse(
    bool Success,
    string Code,
    string Message);
