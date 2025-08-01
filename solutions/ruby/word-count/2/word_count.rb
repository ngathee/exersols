class Phrase
  attr_reader :word_count 
  
  def initialize(string) 
    @word_count = {}
    re = /[\"!?.:@,$^&%]/
    @words = string.gsub(/,/, ' ').strip.downcase.gsub(re, '').split(/[\s]+/).map {|w| w.gsub(/\A'|'\z/, '')}
    @words.each do |word|
      word_count[word] ? word_count[word] += 1 :word_count[word] = 1
    end
  end
end