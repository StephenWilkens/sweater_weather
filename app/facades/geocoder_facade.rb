class GeocoderFacade
  def self.get_coordinates(location)
    json = GeocoderService.get_coordinates(location)
    lat = json[:results][0][:locations][0][:latLng][:lat]
    lng = json[:results].first[:locations].first[:latLng][:lng]
    Geocoder.new(lat, lng)
  end
end
