require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists and has attributes', :vcr do
    location = 'Pueblo, CO'
    category = 'Chinese'
    json = YelpService.get_restaurant(location, category)
    data = json[:businesses][0]
    restaurant = Restaurant.new(data)
    expect(restaurant).to be_an_instance_of(Restaurant)
    expect(restaurant.name).to eq("Wonderful Bistro")
    expect(restaurant.address).to eq("4602 N Elizabeth St, Ste 120, Pueblo, CO 81008")
  end
end
