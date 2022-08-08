require 'rails_helper'

RSpec.describe 'Forecasts Index Action' do
  describe 'happy path' do
    it 'returns the weather forecast', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)
      forecast = rb[:data]

      expect(forecast).to be_a Hash
      expect(forecast[:attributes]).to have_key(:current_weather)
      expect(forecast[:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:attributes][:current_weather]).to have_key(:icon)

      expect(forecast[:attributes][:current_weather]).to_not have_key(:pressure)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:dew_point)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:clouds)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:visibility)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:wind_deg)
      expect(forecast[:attributes][:current_weather]).to_not have_key(:wind_gust)

      expect(forecast[:attributes]).to have_key(:daily_weather)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:date)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:conditions)
      expect(forecast[:attributes][:daily_weather][0]).to have_key(:icon)

      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:moonrise)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:moon_phase)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:temp)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:feels_like)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:pressure)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:humidity)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:dew_point)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:wind_gust)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:clouds)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:pop)
      expect(forecast[:attributes][:daily_weather][0]).to_not have_key(:uvi)
      
      expect(forecast[:attributes]).to have_key(:hourly_weather)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:time)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(forecast[:attributes][:hourly_weather][0]).to have_key(:icon)

      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:dt)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:temp)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:pressure)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:humidity)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:uvi)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:clouds)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:visibility)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:wind_deg)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:wind_gust)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:weather)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:pop)
      expect(forecast[:attributes][:hourly_weather][0]).to_not have_key(:rain)
    end
  end
end
