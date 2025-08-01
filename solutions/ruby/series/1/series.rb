class Series 
  def initialize(string)
    raise ArgumentError if string.size.zero?
    @string = string
  end

  def slices(slice_size)
    raise ArgumentError if slice_size.zero? || slice_size.negative? || !slice_size.is_a?(Integer) || slice_size > @string.size
      
    return [@string] if @string.size <= slice_size
    
    index = 0
    slice_series = []
    while index <= @string.size - slice_size 
      slice_series << @string[index, slice_size]
      index += 1
    end
    
    slice_series
  end
end