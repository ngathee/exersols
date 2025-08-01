module CollatzConjecture 
  def self.steps(number)  
    raise ArgumentError if number <= 0 
    steps = 0
    while number > 1 
      number = number.even? ? number / 2 : number * 3 + 1
      steps += 1 
    end
    steps 
  end 
end