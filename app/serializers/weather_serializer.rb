class WeatherSerializer

  def self.new(weather)
    {
      "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "datetime": weather.current_forcast.date_time,
            "sunrise": weather.current_forcast.sunrise,
            "sunset": weather.current_forcast.sunset,
            "temperature": weather.current_forcast.temperature,
            "feels like": weather.current_forcast.feels_like,
            "humidity": weather.current_forcast.humidity,
            "uvi": weather.current_forcast.uvi,
            "conditions": weather.current_forcast.conditions,
            "icon": weather.current_forcast.icon
          },
          "daily_weather": weather.five_day_forecast.map do |day|
            {
              "date": day.date,
              "sunrise": day.sunrise,
              "sunset": day.sunset,
              "max temp": day.max_temp,
              "min temp": day.min_temp,
              "conditions": day.conditions,
              "icon": day.icon
            }
          end,
          "hourly_weather": weather.eight_hour_forecast.map do |hour|
            {
              "time": hour.time,
              "temperature": hour.temperature,
              "conditions": hour.conditions,
              "icon": hour.icon
            }
          end
        }
      }
    }
  end
end
