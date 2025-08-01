class Proverb 
  def initialize(*words, qualifier: nil) 
    @proverb = [] 
    words[0..-2].each_with_index do |word, index|
      next_word = words[index + 1]
      @proverb << "For want of a #{word} the #{next_word} was lost."
    end
    @proverb << "And all for the want of a #{qualifier.nil? ? words[0] : qualifier + " " + words[0] }."    
  end 

  def to_s 
    @proverb.join("\n")
  end 
end 