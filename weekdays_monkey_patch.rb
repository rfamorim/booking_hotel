module Weekdays
  def is_weekend?
    self.saturday? || self.sunday?
  end

  def is_weekday?
    !(self.is_weekend?)
  end
end

class Date
  include Weekdays
end