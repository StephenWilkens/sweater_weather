require 'rails_helper'

RSpec.describe GeocoderFacade do
  describe '#get_coordinates' do
    it 'creates geocoder object with lat and lng', :vcr do
      location = 'Washington,DC'

      ll = GeocoderFacade.get_coordinates(location)

      expect(ll).to be_a(Geocoder)
      expect(ll.lat).to eq(38.892062)
      expect(ll.lng).to eq(-77.019912)
    end
  end
end
