class Cipher 
  LETTERS = ('a'..'z').to_a.freeze 
  
  def initialize(key = nil)
    if key 
      raise ArgumentError if key.empty? || key.match?(/\A[A-Z]+\z/) || key.match?(/\A\d+\z/) 
      @key = key 
    else 
      @key = LETTERS[rand(0..25)] * 100
    end 
  end 

  def key 
    @key
  end 

  
  def encode(text) 
    cipher = "" 
    text.chars.each_with_index do |char, index| 
      index = (LETTERS.index(char) + LETTERS.index(@key[index])) % 26
      cipher << LETTERS[index]
    end 
    cipher 
  end 

  
  def decode(cipher) 
    text = ""
    cipher.chars.each_with_index do |char, index| 
      index = (LETTERS.index(char) - LETTERS.index(@key[index])) % 26
      text << LETTERS[index]
    end 
    text 
  end 

end 