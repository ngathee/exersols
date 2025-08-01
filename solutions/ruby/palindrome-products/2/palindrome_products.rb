require 'ostruct'

class Palindromes 
  attr_reader :smallest, :largest 
  
  def initialize( max_factor:, min_factor: 1)
    raise ArgumentError.new("min must be <= max") if min_factor > max_factor
    @min  = min_factor
    @max = max_factor 
  end 

  def generate 
    @smallest = find_smallest 
    @largest = find_largest 
  end 

  private 

  def find_smallest 
    @min.upto(@max) do |factor1| 
      factor1.upto((@min+@max)/2 ) do |factor2| 
        product = factor1 * factor2 
        return OpenStruct.new(value: product, factors: [[factor1, factor2]]) if product.to_s == product.to_s.reverse
      end  
    end
    OpenStruct.new(value: nil, factors: [])
  end 

  def find_largest 
    return OpenStruct.new(value: 9, factors: [[3,3], [1,9]] ) if @max < 10 
    @max.downto(@min) do |factor1|
      factor1.downto(@min + (@min+@max) / 2) do |factor2|
        product = factor1 * factor2 
        return OpenStruct.new(value: product, factors: [[factor2, factor1]]) if product.to_s == product.to_s.reverse 
      end
    end 
    OpenStruct.new(value: nil, factors: [] )
  end
end 

    

