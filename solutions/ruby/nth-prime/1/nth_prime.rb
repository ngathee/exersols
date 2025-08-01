module Prime 
  def self.nth(target)
    raise ArgumentError if target <= 0
    n = 100 * target
    counter = 0
    1.upto(n) do |candidate|
      counter += 1 if prime?(candidate)
      return candidate if counter == target 
    end
  end

  private
  def self.prime?(number)
    return false if number < 2
    return true if number == 2 || number == 3
    return false if number % 2 ==0 || number % 3 == 0

    i = 5
    while i**2 <= number 
      return false if number % i == 0 || number % (i + 2) == 0
      i += 6
    end
    true 
  end
end