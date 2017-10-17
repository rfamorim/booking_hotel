#  name       :string
#  rating     :integer

require_relative 'base_class'
require_relative 'fee'

class Hotel < BaseClass
  attr_accessor :name, :rating

  def initialize(attributes) 
    self.name = attributes[:name]
    self.rating = Integer(attributes[:rating])
  end

  def fees
    Fee.all.select{ |f| f.hotel_name.to_s == self.name.to_s }
  end
end
