class Proverb 
  def initialize(*words, qualifier: nil) 
    @proverb = [] 
    words.each_cons(2).map do |wanted, missed|
      @proverb << "For want of a #{wanted} the #{missed} was lost."
    end
    @proverb << "And all for the want of a #{qualifier.nil? ? words.first : qualifier + " " + words.first}."    
  end 

  def to_s 
    @proverb.join("\n")
  end 
end 