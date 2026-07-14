using System.Text.Json;
using RestaurantBooking.Api.Contracts;
using RestaurantBooking.Api.Services;
using RestaurantBooking.Api.Validation;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<IReservationRequestValidator, ReservationRequestValidator>();
builder.Services.AddSingleton<IReservationService, ReservationService>();

var app = builder.Build();

app.UseDefaultFiles();
app.UseStaticFiles();

app.MapPost("/reservations", async (
    HttpRequest httpRequest,
    IReservationRequestValidator validator,
    IReservationService reservationService) =>
{
    using var requestBody = await ParseRequestBody(httpRequest);
    if (requestBody is null)
    {
        return Results.BadRequest(InvalidRequest());
    }

    var validationResult = validator.Validate(requestBody.RootElement);
    if (!validationResult.IsValid)
    {
        return Results.BadRequest(validationResult.Error);
    }

    var result = reservationService.Check(validationResult.Request);
    return result.Success ? Results.Ok(result) : Results.BadRequest(result);
});

app.Run();

static async Task<JsonDocument?> ParseRequestBody(HttpRequest httpRequest)
{
    try
    {
        return await JsonDocument.ParseAsync(httpRequest.Body);
    }
    catch (JsonException)
    {
        return null;
    }
}

static ReservationApiResponse InvalidRequest()
{
    return new ReservationApiResponse(false, "INVALID_REQUEST", "ข้อมูลคำขอไม่ถูกต้อง");
}

public partial class Program;
