module Isogram 
  def self.isogram?(phrase) 
    phrase.gsub!(/[\s-]/, '') # normalize the phrase
    phrase.downcase!
    phrase.chars.uniq == phrase.chars
  end
end