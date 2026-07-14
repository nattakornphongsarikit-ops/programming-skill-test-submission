using RestaurantBooking.Api.Contracts;

namespace RestaurantBooking.Api.Services;

public interface IReservationService
{
    ReservationApiResponse Check(ReservationRequest request);
}
