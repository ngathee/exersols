module CollatzConjecture 
  def self.steps(number) 
    steps = 0 
    raise ArgumentError if number <= 0 
    return steps if number == 1 
    while number > 1 
      if number.even? 
        number = number / 2 
      else 
        number = number * 3 + 1
      end
      steps += 1 
    end
    steps 
  end 
end