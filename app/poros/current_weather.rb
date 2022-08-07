class CurrentWeather
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :conditions,
              :icon

  def initialize(data)
    @date_time = Time.at(data[:current][:dt]).to_datetime
    @sunrise = Time.at(data[:current][:sunrise]).to_datetime
    @sunset = Time.at(data[:current][:sunset]).to_datetime
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @conditions = data[:current][:weather][:description]
    @icon = data[:current][:weather][:icon]
  end
end
