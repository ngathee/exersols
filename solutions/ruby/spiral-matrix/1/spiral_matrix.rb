class SpiralMatrix 
  def initialize(n) 
    @left = 0 
    @right = n - 1 
    @top = 0
    @bottom = n - 1
    @spiral = []
    n.times { @spiral << Array.new(n)}       
  end 

  def matrix 
    step = 1 
    
    while @top <= @bottom && @left <= @right 
      @left.upto(@right) do |i|
        @spiral[@top][i] = step 
        step += 1
      end 
      @top  += 1 

      @top.upto(@bottom) do |i|
        @spiral[i][@right] = step
        step += 1
      end
      @right -= 1 

      if @top <= @bottom 
        @right.downto(@left) do |i| 
          @spiral[@bottom][i] = step 
          step += 1 
        end
        @bottom -= 1 
      end 

      if @left <= @right 
        @bottom.downto(@top) do |i| 
          @spiral[i][@left] = step 
          step += 1 
        end
        @left += 1 
      end 
    end
    
    @spiral 
  end
end 
