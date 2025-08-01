class Robot 
  attr_reader :name 
  @@names = -> do  
    letters = ('A'..'Z').to_a 
    digits = (0..9).to_a 
    names = letters.product(letters, digits, digits, digits).map do |a, b, c, d, e|
      "#{a}#{b}#{c}#{d}#{e}"
    end 
    names.shuffle 
  end.call 

  ALL_NAMES_SIZE = 26*26*1000 
  @@current = rand(0...ALL_NAMES_SIZE)

  def initialize
    @name = names[current] 
  end 

  def reset 
    @name = names[current] 
  end 

  def self.forget
    @@current = rand(0...ALL_NAMES_SIZE) 
  end 

  private 
  def current 
    @@current = (@@current + 1) % (26*26*1000)
  end 

  def names
    @@names 
  end 
end 
