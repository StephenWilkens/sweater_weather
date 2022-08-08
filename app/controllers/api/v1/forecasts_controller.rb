class Api::V1::ForecastsController < ApplicationController
  def index
    ll = GeocoderFacade.get_coordinates(params[:location])
    weather = WeatherFacade.get_weather(ll.lat, ll.lng)

    render json: WeatherSerializer.new(weather)
  end
end