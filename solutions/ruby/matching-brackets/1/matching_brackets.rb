module Brackets
  def self.paired?(string)
    return true if string.empty?
    parens = []
    string.chars.each do |char|
      if char == '{' || char == '[' || char == '('
        parens.push(char)
      else 
        if char == '}'
          parens.last == '{' ? parens.pop : parens.push(char)
        elsif char == ']'
          parens.last == '[' ? parens.pop : parens.push(char)
        elsif char == ')'
          parens.last == '(' ? parens.pop : parens.push(char)
        end 
      end
    end 
    parens.empty? 
  end
end 

