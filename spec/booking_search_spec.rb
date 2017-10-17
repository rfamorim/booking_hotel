#  search                 :text
#  client_type            :integer
#  days                   :string           default("{}"), is an Array
#  best_option_hotel_name :string
#  best_option_total_fee  :decimal(12, 2)

require_relative '../booking_search'

RSpec.describe BookingSearch do
  # RESPOND TO
  [:search, :client_type, :days, :best_option_hotel_name, :best_option_total_fee].each do |attr|
    it "should respond to #{attr}" do
      @booking_search = BookingSearch.new(search: "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)", client_type: nil, days: nil)
      expect(@booking_search).to respond_to attr
    end
  end

  # TESTING SET SEARCH ATTRIBUTES
  describe 'when a booking_search is created without client_type and days' do
    before(:each) do
      @booking_search = BookingSearch.new(search: "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)", client_type: nil, days: nil)
    end

    it 'should set a client_type' do
      expect(@booking_search.client_type).to eq('regular')
    end

    it 'should set days' do
      expect(@booking_search.days).to eq(['16Mar2009(mon)', '17Mar2009(tues)', '18Mar2009(wed)'])
    end
  end

  # TESTING SET BEST OPTION
  { "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)": "Lakewood", "Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)": "Bridgewood", "Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)": "Ridgewood" }.each do |k, v|
    describe "when a booking_search is created" do
      before(:each) do
        @booking_search = BookingSearch.new(search: k.to_s)
      end

      it 'should return the right hotel as best option' do
        expect(@booking_search.best_option_hotel_name.to_s).to eq(v)
      end
    end
  end
end
