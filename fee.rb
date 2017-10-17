#  hotel_name  :string
#  fee_type    :string
#  weekday_fee :float
#  weekend_fee :float

require_relative 'base_class'

class Fee < BaseClass
  attr_accessor :hotel_name, :fee_type, :weekday_fee, :weekend_fee

  def initialize(attributes)
    self.hotel_name = attributes[:hotel_name]
    self.fee_type = attributes[:fee_type].downcase
    self.weekday_fee = Float(attributes[:weekday_fee])
    self.weekend_fee = Float(attributes[:weekend_fee])
  end
end
