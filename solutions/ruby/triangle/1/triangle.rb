class Triangle
  def initialize(sides) 
    @a, @b, @c = sides
  end

  def equilateral?
    valid? && (a == b && b == c)
  end 

  def isosceles?
    valid? && (a == b || b == c || c == a)
  end 

  def scalene? 
    valid? && a != b && b != c && c != a 
  end 

  private
  attr_reader :a, :b, :c 
  
  def valid? 
    return false if a.zero? || b.zero? || c.zero? 
    (a + b >= c) && (b + c >= a) && (a + c >= b)
  end 
end