require 'rails_helper'

RSpec.describe YelpService do
  context 'get restaurants' do
    it 'returns a restaurant based off location and category', :vcr do
      location = 'Denver, CO'
      category = 'Chinese'
      response = YelpService.get_restaurant(location, category)

      expect(response).to be_a(Hash)
      expect(response[:businesses]).to be_a(Array)
      expect(response[:businesses][0]).to be_a(Hash)
      expect(response[:businesses][0]).to have_key(:id)
      expect(response[:businesses][0]).to have_key(:alias)
      expect(response[:businesses][0]).to have_key(:name)
      expect(response[:businesses][0]).to have_key(:image_url)
      expect(response[:businesses][0]).to have_key(:is_closed)
      expect(response[:businesses][0]).to have_key(:url)
      expect(response[:businesses][0]).to have_key(:review_count)
      expect(response[:businesses][0]).to have_key(:categories)
      expect(response[:businesses][0][:categories][0]).to have_key(:alias)
      expect(response[:businesses][0][:categories][0]).to have_key(:title)
      expect(response[:businesses][0]).to have_key(:rating)
      expect(response[:businesses][0]).to have_key(:coordinates)
      expect(response[:businesses][0][:coordinates]).to have_key(:latitude)
      expect(response[:businesses][0][:coordinates]).to have_key(:longitude)
      expect(response[:businesses][0]).to have_key(:transactions)
      expect(response[:businesses][0]).to have_key(:price)
      expect(response[:businesses][0]).to have_key(:location)
      expect(response[:businesses][0][:location]).to have_key(:address1)
      expect(response[:businesses][0][:location]).to have_key(:address2)
      expect(response[:businesses][0][:location]).to have_key(:address3)
      expect(response[:businesses][0][:location]).to have_key(:city)
      expect(response[:businesses][0][:location]).to have_key(:zip_code)
      expect(response[:businesses][0][:location]).to have_key(:country)
      expect(response[:businesses][0][:location]).to have_key(:state)
      expect(response[:businesses][0][:location]).to have_key(:display_address)
      expect(response[:businesses][0]).to have_key(:phone)
      expect(response[:businesses][0]).to have_key(:display_phone)
      expect(response[:businesses][0]).to have_key(:distance)
    end
  end
end