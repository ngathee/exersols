module PerfectNumber
  class << self
    def classify(number)
      raise RuntimeError if number < 0 
      test = aliquot_sum(number)
      case 
      when test == 6 || test == 28 then "perfect"
      when number < test then "abundant"
      else "deficient"
      end
    end

    private 
    def aliquot_sum(number)
      factors = []
      1.upto(Math.sqrt number) do |i|
        factors << i << number/i if number % i == 0
      end
      factors.sum - number
    end
  end
end