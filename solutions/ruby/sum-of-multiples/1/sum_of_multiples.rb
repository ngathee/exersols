class SumOfMultiples 
  def initialize(*points )
    @points = points 
  end

  def to(level) 
    multiples = []
    return 0 if @points.empty?

    @points.each do |point| 
      next if point.zero? 

      i = 1 
      while i * point < level 
        multiples << i * point 
        i += 1 
      end 
    end
      
    multiples.uniq.sum  
  end
end 