class YelpService
  def self.get_restaurant(location, category)
    response = BaseService.yelp_connection.get('v3/businesses/search?') do |f|
      f.headers['Authorization'] = ENV['YELP_KEY']
      f.params['location'] = location
      f.params['categories'] = category
    end
  end
end