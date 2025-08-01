require 'ostruct'

class Palindromes 
  attr_reader :smallest, :largest 
  
  def initialize( max_factor:, min_factor: 1)
    @min  = min_factor
    @max = max_factor 
    @smallest = OpenStruct.new(value: nil, factors: [])
    @largest = OpenStruct.new(value: nil, factors: [])
  end 

  def generate 
    raise ArgumentError.new("min must be <= max") if @min > @max
    smallest = find_smallest
    largest = find_largest
    @smallest.value = smallest.first
    @smallest.factors = smallest.last
    @largest.value = largest.first 
    @largest.factors = largest.last
  end 

  private 
  def factors(number) 
    result = []
    unless number.nil? 
      @min.upto(Math.sqrt(number)) do |factor|
        result << [factor, number/factor].sort if number % factor == 0 
      end
    end
    result
  end

  def find_smallest 
    @min.upto(@max) do |number| 
      number.upto((@min+@max)/2 ) do |factor| 
        product = number * factor 
        return [product, [[number, factor]]] if product.to_s == product.to_s.reverse
      end  
    end
    [nil, []]
  end 

  def find_largest 
    @max.downto(@min) do |number|
      size = number.digits.size 
      reversed = number.digits.join.to_i
      palindrome = number * 10**size + reversed 
      factor = @max 
      while factor**2 >= palindrome 
        return [palindrome, [[palindrome/factor, factor]]] if palindrome % factor == 0
        factor -= 1
      end
    end 
    @max < 10 ? [9, [[3,3], [1,9]]] : [nil, []] 
  end
end 

    

