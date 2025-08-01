module Transpose 
  def self.transpose(input)
    return input.chars.join("\n") unless input.include?("\n") 
    parts = input.split("\n").map{|p| p.chars } 
    longest = parts.map{|part| part.size }.max 
    parts.map do |part| 
      if part.size < longest 
        difference = longest - part.size 
        difference.times { part << "~" }
      end
    end
    
    parts.transpose.map{|p| p.join.gsub(/~+\z/,"").gsub(/~/, " ")}.join("\n")
  end
end 


