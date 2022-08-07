class Weather
  attr_reader     
                  
             

  def initialize(data)
    @current_weather = data[:current]
    @daily_weather = data[:daily]
    @hourly_weather = data[:hourly]
  end

  def current_forcast
    CurrentWeather.new(@current_weather)
  end

  def five_day_forcast
    @daily_weather[0..4].map { |day| DailyWeather.new(day) }
  end

  def eight_hour_forcast
    @hourly_weather[0..7].map { |hour| HourlyWeather.new(hour) }
  end
end

