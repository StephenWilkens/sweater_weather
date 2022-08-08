require 'rails_helper'

RSpec.describe YelpFacade do
  describe 'get_nearby_restaurant' do
    it 'can get a nearby restaurant', :vcr do
      location = 'Denver, CO'
      category = 'Chinese'
      restaurant = YelpFacade.get_nearby_restaurant(location, category)

      expect(restaurant).to be_a(Restaurant)
      expect(restaurant.name).to eq("Fortune Wok to Table")
      expect(restaurant.address).to eq("2817 E 3rd Ave, Denver, CO 80206")
    end
  end
end