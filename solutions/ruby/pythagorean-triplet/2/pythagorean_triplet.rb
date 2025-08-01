module PythagoreanTriplet
  def self.triplets_with_sum(target) 
    triplets = []  
    1.upto(target / 3) do |a| 
      b = target * (target - 2 * a) / (2 * (target -a))
      c = target - a - b 
      triplets << [a, b, c] if a < b && b < c && a**2 + b**2 == c**2  
    end
    triplets 
  end 
end 