require 'rails_helper'

RSpec.describe 'Road Trips create action' do
  describe 'happy path' do
    it 'returns start city, end city, travel time, destination weather at eta(temp & conditions)', :vcr do
      bob = User.create!(email: "bob@gmail.com", password: "abc123", password_confirmation: "abc123")
      bob.gen_api_key
      body = {
               "origin": "Denver,CO",
               "destination": "Pueblo,CO",
               "api_key": "#{bob.api_key}"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)

      expect(rb).to have_key(:data)
      expect(rb[:data]).to have_key(:type)
      expect(rb[:data]).to have_key(:id)
      expect(rb[:data]).to have_key(:attributes)
      expect(rb[:data][:attributes]).to have_key(:start_city)
      expect(rb[:data][:attributes]).to have_key(:end_city)
      expect(rb[:data][:attributes]).to have_key(:travel_time)
      expect(rb[:data][:attributes]).to have_key(:weather_at_eta)
      expect(rb[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(rb[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end

  describe 'sad path' do
    it 'returns an error if an invalid api key is given', :vcr do
      body = {
               "origin": "Denver,CO",
               "destination": "Pueblo,CO",
               "api_key": "adafr43"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end