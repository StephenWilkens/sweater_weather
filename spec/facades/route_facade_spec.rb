require 'rails_helper'

RSpec.describe RouteFacade do
  describe 'route info' do
    it 'can get information for a route between two locations', :vcr do
      from = 'Denver, CO'
      to = 'Huntington Beach, CA'
      route = RouteFacade.route_info(from, to)

      expect(route).to be_an_instance_of(Route)
      expect(route.start_city).to eq('Denver, CO')
      expect(route.end_city).to eq('Huntington Beach, CA')
      expect(route.travel_time).to eq('14:38:50')
    end
  end
end
