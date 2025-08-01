class Scrabble 
  def initialize(word) 
    @letters = word.downcase.chars
  end

  def score 
    sum = 0
    @letters.each {|letter| sum += char_value(letter)}
    sum 
  end

  def char_value(char)
    case char
    when 'a','e','i','o','u','l','n','r','s','t' then 1 
    when 'd', 'g'then 2 
    when 'b','c','m','p' then 3 
    when 'f','h','v','w','y' then 4 
    when 'k' then 5 
    when 'j','x' then 8
    when 'q', 'z' then 10
    else 0
    end
  end
end