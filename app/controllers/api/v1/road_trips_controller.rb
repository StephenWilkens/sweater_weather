class Api::V1::RoadTripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    ll = GeocoderFacade.get_coordinates(params[:destination])
    weather = WeatherFacade.get_weather(ll.lat, ll.lng)
    route = RouteFacade.route_info(params[:origin], params[:destination])

    if user
      if route
        render json: RouteSerializer.new(route, weather)
      else
        render json: ImpossibleRouteSerializer.new(params[:origin], params[:destination])
      end
    else
      render json: { error: 'Invalid key' }, status: :unauthorized
    end
  end
end
