class Api::V1::RestaurantsController < ApplicationController
  def show
    ll = GeocoderFacade.get_coordinates(params[:location])
    weather = WeatherFacade.get_weather(ll.lat, ll.lng)
    restaurant = YelpFacade.get_nearby_restaurant(params[:location], params[:food])
    x = render json: RestaurantSerializer.new(params[:location], weather, restaurant)
    require "pry"; binding.pry
  end
end