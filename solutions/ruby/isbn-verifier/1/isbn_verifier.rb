module IsbnVerifier 
  def self.valid?(string) 
    string.gsub!("-", "")
    return false if string.size < 10 || string.size > 10 || string[0...9].chars.any? {|char| char.match?(/[[:alpha:]]/)}
    chars = string.chars 
    return false unless chars[-1].match?(/[0-9X]/)
    
    chars[-1] = 10 if chars[-1] == "X"
    chars.map(&:to_i).zip(10.downto(1)).map {|e| e[0] * e[1]}.sum % 11 == 0
  end 
end 