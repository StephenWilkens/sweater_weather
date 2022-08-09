class Api::V1::RoadTripsController < ApplicationController
  def show
    ll = GeocoderFacade.get_coordinates(params[:destination])
    weather = WeatherFacade.get_weather(ll.lat, ll.lng)
    route = RouteFacade.route_info(params[:origin], params[:destination])

    render json: RouteSerializer.new(route, weather)
  end
end