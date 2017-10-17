#  hotel_name  :string
#  fee_type    :string
#  weekday_fee :float
#  weekend_fee :float

require_relative '../fee'

RSpec.describe Fee do
  # RESPOND TO
  [:hotel_name, :fee_type, :weekday_fee, :weekend_fee].each do |attr|
    it "should respond to #{attr}" do
      @fee = Fee.new(hotel_name: "Lakewood", fee_type: "regular", weekday_fee: "40.00", weekend_fee: "30.00")
      expect(@fee).to respond_to attr
    end
  end

  # TESTING THE CLASS METHOD ALL
  describe 'when several fees are generated' do
    before(:each) do
      @fee1 = Fee.new(hotel_name: "Lakewood", fee_type: "regular", weekday_fee: "40.00", weekend_fee: "30.00")
      @fee2 = Fee.new(hotel_name: "Bridgewood", fee_type: "regular", weekday_fee: "50.00", weekend_fee: "40.00")
      @fee3 = Fee.new(hotel_name: "Riverwood", fee_type: "rewards", weekday_fee: "60.00", weekend_fee: "50.00")
    end

    it 'should return the right collection' do
      expect(Fee.all).to include(@fee1)
      expect(Fee.all).to include(@fee2)
      expect(Fee.all).to include(@fee3)
    end
  end
end
