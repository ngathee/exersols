module PerfectNumber
  class << self
    def classify(number)
      raise RuntimeError if number < 0 
      case 
      when number > aliquot_sum(number) then "deficient"
      when number < aliquot_sum(number) then "abundant"
      else "perfect"
      end
    end

    private 
    def aliquot_sum(number)
      factors = []
      1.upto(number/2).select do |i|
        factors << i if number.modulo(i).zero?
      end
      factors.sum
    end
  end
end