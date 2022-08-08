class RestaurantSerializer
  def self.new(location, weather, restaurant)
    {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": location,
          "forecast": {
            "summary": weather.current_forecast.conditions,
            "temperature": weather.current_forecast.temperature
          },
          "restaurant": {
            "name": restaurant.name,
            "address": restaurant.address
          }
        }
      }
    }
  end
end