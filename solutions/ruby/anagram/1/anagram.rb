class Anagram
  def initialize(target_word)
    @word = target_word 
  end

  def match(anagram_candidates)
    anagrams = []
    anagram_candidates.each do |candidate|
      anagrams << candidate if anagram?(candidate)
    end
    anagrams 
  end 

  private 
  attr_reader :word 

  def anagram?(target)
    return false if word.downcase == target.downcase 
    word.downcase.chars.sort.join == target.downcase.chars.sort.join 
  end
end 