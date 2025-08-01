module ArmstrongNumbers
  def self.include?(number)
    return true if number < 10 
    sum = 0 
    digits = number.to_s.chars.map(&:to_i)
    digits_count = digits.size 

    digits.each {|digit| sum += digit ** digits_count }

    sum == number 
  end
end
