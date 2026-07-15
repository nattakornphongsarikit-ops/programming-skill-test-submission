namespace RestaurantBooking.Api.Contracts;

public sealed record ReservationRequest(
    DateOnly ReservationDate,
    TableType TableType,
    decimal Deposit);
