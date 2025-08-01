require 'prime'

module PrimeFactors 
  def self.of(number) 
    factors = number.prime_division.each_with_object([]) do |factor, result|
      prime, count = factor 
      count.times { result << prime }
    end 
  end
end 
