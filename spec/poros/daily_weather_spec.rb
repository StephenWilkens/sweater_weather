require 'rails_helper'

RSpec.describe DailyWeather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    data = WeatherService.get_weather(lat, long)
    denver_weather = Weather.new(data)
    dw = denver_weather.five_day_forecast

    expect(dw).to be_an(Array)
    expect(dw[0]).to be_an_instance_of(DailyWeather)
    expect(dw[0].date).to eq(Time.at(data[:daily][0][:dt]).to_date)
    expect(dw[0].sunrise).to eq(Time.at(data[:daily][0][:sunrise]).to_datetime)
    expect(dw[0].sunset).to eq(Time.at(data[:daily][0][:sunset]).to_datetime)
    expect(dw[0].max_temp).to eq(data[:daily][0][:temp][:max])
    expect(dw[0].min_temp).to eq(data[:daily][0][:temp][:min])
    expect(dw[0].conditions).to eq(data[:daily][0][:weather][0][:description])
    expect(dw[0].icon).to eq(data[:daily][0][:weather][0][:icon])
  end
end