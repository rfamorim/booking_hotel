#  search                 :text
#  client_type            :string
#  days                   :string           default("{}"), is an Array
#  best_option_hotel_name :string
#  best_option_total_fee  :decimal(12, 2)

require_relative 'base_class'
require_relative 'setting'
require_relative 'hotel'
require_relative 'fee'
require_relative 'weekdays_monkey_patch'

class BookingSearch < BaseClass
  attr_accessor :search, :client_type, :days, :best_option_hotel_name, :best_option_total_fee

  def initialize(attributes)
    self.search = attributes[:search]

    # Load hotels and their fees
    Setting.hotels_setup
    Setting.fees_setup

    set_search_attributes
    set_best_option
    print_result
  end

  private
    def set_search_attributes
      # Input of search format = "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"

      self.client_type = self.search.split(":").first.downcase
      self.days = self.search.split(": ").last.split(", ")
    end

    def set_best_option
      return true if Hotel.count == 0

      weekdays_count = 0
      weekends_count = 0

      self.days.each do |d|
        # Date Format = "16Mar2009(mon)"

        day = d.split("(").first

        require 'date'
        if Date.parse(day).is_weekend?
          weekends_count += 1
        else
          weekdays_count += 1
        end
      end

      best_hotel = ""
      best_hotel_rating = nil
      total_fee = nil

      Hotel.all.each do |h|
        fee = h.fees.select{ |f| f.fee_type.to_s == self.client_type.to_s }.first

        hotel_fee = (weekdays_count * fee.weekday_fee) + (weekends_count * fee.weekend_fee)

        if (total_fee.nil?) or (hotel_fee < total_fee)
          total_fee = hotel_fee
          best_hotel = h.name
          best_hotel_rating = h.rating
          next

        elsif hotel_fee == total_fee
          if h.rating > best_hotel_rating
            best_hotel = h.name
            best_hotel_rating = h.rating
          end
        end
      end

      self.best_option_hotel_name = best_hotel
      self.best_option_total_fee = total_fee
    end

    def print_result
      puts "\nHotel desejado para a busca '#{self.search.strip}' é: #{self.best_option_hotel_name}, com o custo total de: #{self.best_option_total_fee}."
    end
end
