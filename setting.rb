require_relative 'base_class'
require_relative 'hotel'
require_relative 'fee'

class Setting < BaseClass
  def self.hotels_setup
    hotels = []

    # Setting the Hotels
    { "Lakewood": 3, "Bridgewood": 4, "Ridgewood": 5 }.each do |k, v|
      hotels.push Hotel.new(name: k, rating: v)
    end

    hotels
  end

  def self.fees_setup
    fees = []

    # Hotel Lakewood fees
    { "regular": [110.00, 90.00], "rewards": [80.00, 80.00] }.each do |k, v|
      fees.push Fee.new(hotel_name: "Lakewood", fee_type: k, weekday_fee: v[0], weekend_fee: v[1])
    end

    # Hotel Bridgewood fees
    { "regular": [160.00, 60.00], "rewards": [110.00, 50.00] }.each do |k, v|
      fees.push Fee.new(hotel_name: "Bridgewood", fee_type: k, weekday_fee: v[0], weekend_fee: v[1])
    end

    # Hotel Ridgewood fees
    { "regular": [220.00, 150.00], "rewards": [100.00, 40.00] }.each do |k, v|
      fees.push Fee.new(hotel_name: "Ridgewood", fee_type: k, weekday_fee: v[0], weekend_fee: v[1])
    end

    # On each Hash iteration, 'k' stands for 'key' and 'v' stands for 'value'

    fees
  end
end