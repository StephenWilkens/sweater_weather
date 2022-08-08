class Restaurant
  attr_reader :name,
              :address

  def initialize(data)
    @name = data[:name]
    @address = "#{data[:location][:address1]}, #{data[:location][:city]}, #{data[:location][:state]} #{data[:location][:zip_code]}"
  end
end