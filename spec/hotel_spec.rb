#  name       :string
#  rating     :integer

require_relative '../hotel'

RSpec.describe Hotel do
  # RESPOND TO
  [:name, :rating].each do |attr|
    it "should respond to #{attr}" do
      @hotel = Hotel.new(name: "Fake Hotel", rating: 10)
      expect(@hotel).to respond_to attr
    end
  end

  # TESTING THE CLASS METHOD ALL
  describe 'when several hotels are generated' do
    before(:each) do
      @hotel1 = Hotel.new(name: "Fake Hotel 1", rating: 1)
      @hotel2 = Hotel.new(name: "Fake Hotel 2", rating: 2)
      @hotel3 = Hotel.new(name: "Fake Hotel 3", rating: 3)
    end

    it 'should return the right collection' do
      expect(Hotel.all).to include(@hotel1)
      expect(Hotel.all).to include(@hotel2)
      expect(Hotel.all).to include(@hotel3)
    end
  end

  # TESTING THE CLASS METHOD COUNT

  # TESTING THE INSTANCE METHOD FEES
  describe 'when several fees are generated' do
    before(:each) do
      @hotel = Hotel.new(name: "Hotel for fees", rating: 5)
      @fee1 = Fee.new(hotel_name: @hotel.name, fee_type: "regular", weekday_fee: "40.00", weekend_fee: "30.00")
      @fee2 = Fee.new(hotel_name: @hotel.name, fee_type: "regular", weekday_fee: "50.00", weekend_fee: "40.00")
      @fee3 = Fee.new(hotel_name: @hotel.name, fee_type: "rewards", weekday_fee: "60.00", weekend_fee: "50.00")
    end

    it 'should return the right collection' do
      expect(@hotel.fees).to include(@fee1)
      expect(@hotel.fees).to include(@fee2)
      expect(@hotel.fees).to include(@fee3)
    end
  end
end
