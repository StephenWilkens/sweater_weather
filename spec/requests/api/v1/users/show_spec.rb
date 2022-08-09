RSpec.describe 'Users show Action' do
  describe 'happy path' do
    it 'finds a user and issues a response' do
      body = {
               "email": "bob@gmail.com",
               "password": "abc123"
             }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      rb = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
    end
  end
end