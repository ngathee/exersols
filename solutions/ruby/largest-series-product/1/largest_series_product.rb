class Series
  def initialize(input)
    @input = input 
  end 

  def largest_product(span) 
    raise ArgumentError if @input.match?(/[a-z]/) || @input.empty? || @input.size < span 
    @input.chars.each_cons(span).map do |e| 
      e.map(&:to_i).inject(1) {|product, value| product * value }
    end.max
  end 
end 