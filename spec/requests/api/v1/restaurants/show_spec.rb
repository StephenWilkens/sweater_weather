require 'rails_helper'

RSpec.describe 'Restaurants Show Action' do
  describe 'happy path' do
    it 'returns the city, weather summary, and restaurants name and address', :vcr do
      get '/api/v1/munchies?location=denver,co&food=chinese'

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)
      munchies = rb[:data]

      expect(munchies).to be_a Hash
      expect(munchies).to have_key(:id)
      expect(munchies[:id]).to eq(nil)
      expect(munchies).to have_key(:type)
      expect(munchies[:type]).to eq("munchie")
      expect(munchies).to have_key(:attributes)
      expect(munchies[:attributes]).to have_key(:destination_city)

      expect(munchies[:attributes]).to have_key(:forecast)
      expect(munchies[:attributes][:forecast]).to have_key(:summary)
      expect(munchies[:attributes][:forecast]).to have_key(:temperature)
      expect(munchies[:attributes][:forecast]).to_not have_key(:datetime)
      expect(munchies[:attributes][:forecast]).to_not have_key(:sunrise)
      expect(munchies[:attributes][:forecast]).to_not have_key(:sunset)
      expect(munchies[:attributes][:forecast]).to_not have_key(:feels_like)
      expect(munchies[:attributes][:forecast]).to_not have_key(:humidity)
      expect(munchies[:attributes][:forecast]).to_not have_key(:uvi)
      expect(munchies[:attributes][:forecast]).to_not have_key(:conditions)
      expect(munchies[:attributes][:forecast]).to_not have_key(:icon)

      expect(munchies[:attributes]).to have_key(:restaurant)
      expect(munchies[:attributes][:restaurant]).to have_key(:name)
      expect(munchies[:attributes][:restaurant]).to have_key(:address)
    end
  end
end