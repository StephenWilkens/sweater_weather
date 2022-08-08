class WeatherService
  def self.get_weather(lat, long)
    response = BaseService.weather_connection.get('/data/2.5/onecall?') do |f|
      f.params['appid'] = ENV['WEATHER_KEY']
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
    end
    BaseService.get_json(response)
  end
end