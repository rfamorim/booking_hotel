class BaseClass
 def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end   
end