module RotationalCipher
  def self.rotate(text, rotation) 
    lower = ("a"..'z').to_a
    upper = ("A"..'Z').to_a

    cipher = ""
    text.chars.map do |char|
      case 
      when /[[:upper:]]/.match?(char)
        cipher += upper[(upper.index(char) + rotation) % 26]
      when /[[:lower:]]/.match?(char) 
        cipher += lower[(lower.index(char) + rotation) % 26 ]
      else
        cipher += char 
      end 
    end 
    cipher 
  end
end 