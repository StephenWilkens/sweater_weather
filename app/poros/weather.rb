class Weather
  def initialize(data)
    @current_weather = data[:current]
    @daily_weather = data[:daily]
    @hourly_weather = data[:hourly]
  end

  def current_forecast
    CurrentWeather.new(@current_weather)
  end

  def five_day_forecast
    @daily_weather[0..4].map { |day| DailyWeather.new(day) }
  end

  def eight_hour_forecast
    @hourly_weather[0..7].map { |hour| HourlyWeather.new(hour) }
  end

  def weather_at_eta(eta)
    HourlyWeather.new(@hourly_weather[eta])
  end
end
