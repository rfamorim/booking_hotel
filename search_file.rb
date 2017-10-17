#  file_path      :string
#  file_extension :string

require_relative 'base_class'
require_relative 'booking_search'

class SearchFile < BaseClass
  attr_accessor :force_tests, :file_path, :file_extension

  def initialize(attributes)
    self.file_path = attributes[:file_path]
    set_file_extension
    get_searches
  end

  private
    def set_file_extension
      self.file_extension = self.file_path.split(".").last
    end

    def get_searches
      # only works for open-source extensions such as .rtf and .txt

      if self.file_extension == "txt" or self.file_extension == "rtf"
        file = File.open(self.file_path, "r")

        file.each_line do |line|
          BookingSearch.new(search: line)
        end
      else
        puts "\nSeu arquivo precisa ter a extesão .rtf ou .txt"
      end
    end
end
