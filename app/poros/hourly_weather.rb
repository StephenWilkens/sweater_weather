class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:hourly][:dt]).to_datetime
    @temperature = data[:hourly][:temp]
    @conditions = data[:hourly][:weather][:description]
    @icon = data[:hourly][:hourly][:icon]
  end
end