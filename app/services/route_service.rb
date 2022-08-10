class RouteService
  def self.get_route(from, to)
    response = BaseService.mapquest_connection.get('/directions/v2/route?') do |f|
      f.params['key'] = ENV['MAPQUEST_KEY']
      f.params['from'] = from
      f.params['to'] = to
    end
    BaseService.get_json(response)
  end
end