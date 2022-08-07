require 'rails_helper'

RSpec.describe CurrentWeather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    data = WeatherService.get_weather(lat, long)
    denver_weather = Weather.new(data)
    cw = denver_weather.current_forecast

    expect(cw).to be_an_instance_of(CurrentWeather)
    expect(cw.date_time).to eq(Time.at(data[:current][:dt]).to_datetime)
    expect(cw.sunrise).to eq(Time.at(data[:current][:sunrise]).to_datetime)
    expect(cw.sunset).to eq(Time.at(data[:current][:sunset]).to_datetime)
    expect(cw.temperature).to eq(data[:current][:temp])
    expect(cw.feels_like).to eq(data[:current][:feels_like])
    expect(cw.humidity).to eq(data[:current][:humidity])
    expect(cw.uvi).to eq(data[:current][:uvi])
    expect(cw.conditions).to eq(data[:current][:weather][0][:description])
    expect(cw.icon).to eq(data[:current][:weather][0][:icon])
  end
end
