class CircularBuffer 
  class BufferFullException < StandardError; end 
  class BufferEmptyException < StandardError; end 
  
  def initialize(size) 
    @buffer = Array.new(size)
    @size = size 
    @head = 0
    @tail = 0
    @counter = 0 
  end 

  def write(value)
    raise BufferFullException if full?
    @buffer[@head] = value 
    @head = (@head + 1) % @size 
    @counter += 1     
  end 

  def write!(value)
    if full? 
      @tail = (@tail + 1) % @size 
      @counter -= 1
    end

    write(value)
  end
  
  def read 
    raise BufferEmptyException if empty?
    value = @buffer[@tail]
    @buffer[@tail] = nil 
    @tail = (@tail + 1) % @size 
    @counter -= 1 
    
    value 
  end 

  def clear 
    @buffer = Array.new(@size)
    @head = 0
    @tail = 0 
    @counter = 0 
  end 

  private 
  def empty?
    @counter == 0
  end 

  def full?
    @counter == @size 
  end 
end 