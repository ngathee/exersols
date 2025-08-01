module Isogram 
  def self.isogram?(phrase) 
    phrase.gsub!(/[\s-]/, '') # normalize the phrase
    not phrase.downcase.chars.tally.any?{|_, v| v > 1}
  end
end