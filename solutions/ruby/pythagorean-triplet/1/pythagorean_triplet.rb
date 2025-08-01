module PythagoreanTriplet
  def self.triplets_with_sum(target) 
    triplets = []  
    a = 1
    a.upto(target - 2) do |a| 
      numerator = (a**2 *2) + (target**2) - (a * 2 * target)
      denominator = (target - a) * 2 

      next if denominator == 0 || numerator % denominator != 0

      c = numerator / denominator 
      b = target - a - c 

      triplets << [a, b, c] if b > a 
    end
    triplets 
  end 
end 