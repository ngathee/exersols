=begin
Write your code for the 'Darts' exercise in this file. Make the tests in
`darts_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/darts` directory.
=end
class Darts
  def initialize(x, y)
    @x, @y = x, y 
  end 

  def score
    radius = Math.sqrt(@x**2 + @y**2)
    if radius > 10 
      return 0 
    elsif radius > 5 
      return 1 
    elsif radius > 1 
      return 5 
    else 
      return 10
    end
  end 
end