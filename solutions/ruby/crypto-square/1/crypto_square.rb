class Crypto 
  def initialize(text) 
    @text = text.scan(/\w+/).join.downcase
  end 

  def ciphertext 
    size = text.empty? ? 1 : text.size 
    c = (size/ ((Math.sqrt(size)).round).to_f).round 
    cipher = text.chars.each_slice(c).to_a 
    (c - cipher.last.size).times { cipher.last << " " } if cipher.last && cipher.last.size < c 
    cipher.transpose.map(&:join).join(" ")
  end 

  private 
  attr_reader :text 
end
