class BinarySearch
  def initialize(array)
    @array = array.sort 
  end

  def search_for(term)
    return nil if @array.empty?
    left = 0
    right = @array.size - 1 
    while left <= right 
      middle = (left + right) / 2
      if @array[middle] < term 
        left = middle +  1
      elsif @array[middle] > term 
        right = middle - 1
      else 
        return middle
      end
    end
    nil 
  end
end 

    