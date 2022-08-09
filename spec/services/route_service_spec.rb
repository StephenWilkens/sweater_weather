require 'rails_helper'

RSpec.describe RouteService do
  context 'get route' do
    it 'returns a route between two locations', :vcr do
      from = 'Denver, CO'
      to = 'Huntington Beach, CA'
      response = RouteService.get_route(from, to)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:route)
      expect(response[:route]).to have_key(:formattedTime)
      expect(response[:route]).to have_key(:locations)
      expect(response[:route][:locations][0]).to have_key(:adminArea5)
      expect(response[:route][:locations][0][:adminArea5]).to eq('Denver')
      expect(response[:route][:locations][0]).to have_key(:adminArea3)
      expect(response[:route][:locations][0][:adminArea3]).to eq('CO')
      expect(response[:route][:locations][1]).to have_key(:adminArea5)
      expect(response[:route][:locations][1][:adminArea5]).to eq('Huntington Beach')
      expect(response[:route][:locations][1]).to have_key(:adminArea3)
      expect(response[:route][:locations][1][:adminArea3]).to eq('CA')
    end
  end
end