module Complement 
  DNA={"G"=>"C", "C"=>"G", "T"=>"A", "A"=>"U"}

  def self.of_dna(strand)
    result = ""
    strand.upcase.chars.each {|char| result += DNA[char]}
    result
  end
end