class RouteSerializer

  def self.new(route, weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": route.start_city,
          "end_city": route.end_city,
          "travel_time": route.travel_time,
          "weather_at_eta": {
            "temperature": weather.weather_at_eta(route.eta_hour).temperature,
            "conditions": weather.weather_at_eta(route.eta_hour).conditions
          }
        }
      }
    }
  end
end