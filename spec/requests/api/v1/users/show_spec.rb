require 'rails_helper'

RSpec.describe 'Users show Action' do
  describe 'happy path' do
    it 'finds a user and issues a response' do

      bob = User.create!(email: "bob@gmail.com", password: "abc123", password_confirmation: "abc123")
      bob.gen_api_key
      body = {
               "email": "bob@gmail.com",
               "password": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)

      expect(rb).to have_key(:data)
      expect(rb[:data]).to have_key(:type)
      expect(rb[:data]).to have_key(:id)
      expect(rb[:data]).to have_key(:attributes)
      expect(rb[:data][:attributes]).to have_key(:email)
      expect(rb[:data][:attributes]).to have_key(:api_key)
      expect(rb[:data][:attributes]).to_not have_key(:password)
      expect(rb[:data][:attributes]).to_not have_key(:password_confirmation)
      expect(rb[:data][:attributes]).to_not have_key(:password_digest)
    end
  end

  describe 'sad path' do
    it 'returns an error message if no matching email is found' do
      bob = User.create!(email: "bob@gmail.com", password: "abc123", password_confirmation: "abc123")
      bob.gen_api_key
      body = {
               "email": "bop@gmail.com",
               "password": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq (400)
    end

    it 'returns an error message if password is incorrect' do
      bob = User.create!(email: "bob@gmail.com", password: "abc123", password_confirmation: "abc123")
      bob.gen_api_key
      body = {
               "email": "bob@gmail.com",
               "password": "bbc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to_not be_successful
      expect(response.status).to eq (400)
    end
  end
end
