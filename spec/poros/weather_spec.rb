require 'rails_helper'

RSpec.describe Weather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    data = WeatherService.get_weather(lat, long)
    denver_weather = Weather.new(data)

    expect(denver_weather).to be_an_instance_of(Weather)
    expect(denver_weather.current_forecast).to be_an_instance_of(CurrentWeather)
    expect(denver_weather.five_day_forecast).to be_an(Array)
    expect(denver_weather.eight_hour_forecast).to be_an(Array)
  end

  it 'can create an hourly weather poro for a given time', :vcr do
    lat = '39.7392'
    long = '104.9903'
    data = WeatherService.get_weather(lat, long)
    denver_weather = Weather.new(data)
    eta_weather = denver_weather.weather_at_eta(14)

    expect(eta_weather).to be_an_instance_of(HourlyWeather)
    expect(eta_weather.temperature).to be_an(Float)
    expect(eta_weather.conditions).to be_an(String)
  end
end
