class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:daily][:dt]).to_date
    @sunrise = Time.at(data[:daily][:sunrise]).to_datetime
    @sunset = Time.at(data[:daily][:sunset]).to_datetime
    @max_temp = data[:daily][:temp][:max]
    @min_temp = data[:daily][:temp][:min]
    @conditions = data[:daily][:weather][:description]
    @icon = data[:daily][:weather][:icon]
  end
end
