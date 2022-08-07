class Api::V1::ForecastController < ApplicationController
  def index
    ll = GeocoderFacade.get_coordinates(location)
    weather = WeatherFacade.get_weather(ll.coordinates)

    render json: WeatherSerializer.new(weather)
    require "pry"; binding.pry
  end
end