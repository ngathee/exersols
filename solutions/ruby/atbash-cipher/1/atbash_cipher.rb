module Atbash
  module_function 
  def encode(text)
    text.downcase.gsub(/[\s,\.]+/, '').chars.map do |char|
      char.match?(/\d/) ? char : tr_map[char]
    end.each_slice(5).to_a.map(&:join).join(" ")
  end 

  def decode(cipher)
    cipher.gsub(/\s/, '').chars.map do |char|
      char.match?(/\d/) ? char : tr_map[char]
    end.join
  end 

  def tr_map
    (('a'..'z').to_a.zip(('a'..'z').to_a.reverse)).to_h 
  end
  private_class_method :tr_map 
end 