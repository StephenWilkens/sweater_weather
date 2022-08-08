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
    @date_time = Time.at(data[:dt]).to_datetime
    @sunrise = Time.at(data[:sunrise]).to_datetime
    @sunset = Time.at(data[:sunset]).to_datetime
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
