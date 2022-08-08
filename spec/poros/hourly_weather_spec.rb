require 'rails_helper'

RSpec.describe HourlyWeather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    data = WeatherService.get_weather(lat, long)
    denver_weather = Weather.new(data)
    hw = denver_weather.eight_hour_forecast

    expect(hw).to be_an Array
    expect(hw[0]).to be_an_instance_of(HourlyWeather)
    expect(hw[0].time).to eq(Time.at(data[:hourly][0][:dt]).to_datetime)
    expect(hw[0].temperature).to eq(data[:hourly][0][:temp])
    expect(hw[0].conditions).to eq(data[:hourly][0][:weather][0][:description])
    expect(hw[0].icon).to eq(data[:hourly][0][:weather][0][:icon])
  end
end