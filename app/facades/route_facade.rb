class RouteFacade
  def self.route_info(from, to)
    json = RouteService.get_route(from, to)
    Route.new(json)
  end
end