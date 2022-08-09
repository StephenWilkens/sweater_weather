require 'rails_helper'

RSpec.describe Route do
  it 'exists and has readable attributes', :vcr do
    from = 'Denver, CO'
    to = 'Huntington Beach, CA'
    data = RouteService.get_route(from, to)
    route = Route.new(data)

    expect(route).to be_an_instance_of(Route)
    expect(route.start_city).to eq('Denver, CO')
    expect(route.end_city).to eq('Huntington Beach, CA')
    expect(route.travel_time).to eq('14:38:50')
  end

  it 'can get the eta hour alone', :vcr do
    from = 'Denver, CO'
    to = 'Huntington Beach, CA'
    data = RouteService.get_route(from, to)
    route = Route.new(data)

    expect(route.eta_hour).to eq(14)
  end
end
