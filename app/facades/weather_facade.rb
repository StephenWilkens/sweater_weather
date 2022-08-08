class WeatherFacade
  def self.get_weather(lat, long)
    json = WeatherService.get_weather(lat, long)
    # require "pry"; binding.pry
    Weather.new(json)
  end
end