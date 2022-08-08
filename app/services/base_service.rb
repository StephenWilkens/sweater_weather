class BaseService
  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.mapquest_connection
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.weather_connection
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
