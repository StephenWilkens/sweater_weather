require 'rails_helper'

RSpec.describe WeatherService do 
  it 'returns the weather based on lat long', :vcr do 
    lat = '39.7392'
    long = '104.9903'

    response = WeatherService.get_weather(lat, long)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
    expect(response[:current]).to have_key(:dt)
    expect(response[:current]).to have_key(:sunrise)
    expect(response[:current]).to have_key(:sunset)
    expect(response[:current]).to have_key(:temp)
    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current]).to have_key(:humidity)
    expect(response[:current]).to have_key(:uvi)
    expect(response[:current]).to have_key(:weather)
    expect(response[:current][:weather][0]).to have_key(:description)
    expect(response[:current][:weather][0]).to have_key(:icon)

    expect(response[:daily][0]).to have_key(:dt)
    expect(response[:daily][0]).to have_key(:sunrise)
    expect(response[:daily][0]).to have_key(:sunset)
    expect(response[:daily][0]).to have_key(:temp)
    expect(response[:daily][0][:temp]).to have_key(:max)
    expect(response[:daily][0][:temp]).to have_key(:min)
    expect(response[:daily][0]).to have_key(:weather)
    expect(response[:daily][0][:weather][0]).to have_key(:description)
    expect(response[:daily][0][:weather][0]).to have_key(:icon)

    expect(response[:hourly][0]).to have_key(:dt)
    expect(response[:hourly][0]).to have_key(:temp)
    expect(response[:hourly][0]).to have_key(:weather)
    expect(response[:hourly][0][:weather][0]).to have_key(:description)
    expect(response[:hourly][0][:weather][0]).to have_key(:icon)
  end
end
