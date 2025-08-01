
class Array 
  def add(element)
    return self if self.include?(element)
    self << element 
    self.sort 
  end 
  
  def subset?(other) 
    self.each do |element|
      return false unless other.include?(element)
    end 
    true 
  end 

  def disjoint?(other)
    self.each do |element|
      return false if other.include?(element)
    end 
    true     
  end 

  def union(other)
    (self + other).uniq.sort 
  end 
end 

class CustomSet < Array 
  def self.new(array)
    @elements = array.uniq.sort
  end 
end 