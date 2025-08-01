module Pangram
  LETTERS = ('a'..'z') 

  def self.pangram?(sentence)
    sentence.downcase! 
    LETTERS.all? {|letter| sentence.include?(letter)}
  end
end