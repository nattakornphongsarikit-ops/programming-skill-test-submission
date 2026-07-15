using System.Text.Json;

namespace RestaurantBooking.Api.Validation;

public interface IReservationRequestValidator
{
    ReservationValidationResult Validate(JsonElement requestBody);
}
