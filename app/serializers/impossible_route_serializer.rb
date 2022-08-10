class ImpossibleRouteSerializer

  def self.new(start_city, end_city)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": start_city,
          "end_city": end_city,
          "travel_time": 'Impossible',
          "weather_at_eta": {
          }
        }
      }
    }
  end
end
