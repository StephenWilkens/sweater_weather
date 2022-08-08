class YelpFacade
  def self.get_nearby_restaurant(location, category)
    json = YelpService.get_restaurant(location, category)
    restaurant = json[:businesses][0]
    Restaurant.new(restaurant)
  end
end