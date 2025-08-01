module RailFenceCipher 
  module_function 
  def encode(text, rails)
    matrix = zigzag(rails, text.size).zip(text.chars) 
    matrix.sort.map{|element| element[1]}.join 
  end 

  def decode(text, rails) 
    matrix = zigzag(rails, text.size).sort.zip(text.chars) 
    matrix.sort_by {|element| element[0][1]}.map {|element| element[1] }.join
  end 

  def zigzag(depth, length)
    ((0...depth).to_a + (1...depth-1).to_a.reverse).cycle.first(length).zip(0..length)
  end 
  private_class_method :zigzag 
end  