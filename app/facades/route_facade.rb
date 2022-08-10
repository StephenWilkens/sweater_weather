class RouteFacade
  def self.route_info(from, to)
    json = RouteService.get_route(from, to)
    # require "pry"; binding.pry
    if json[:info][:statuscode] == 0
      Route.new(json)
    end
  end
end