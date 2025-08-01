class CircularBuffer 
  class BufferFullException < StandardError; end 
  class BufferEmptyException < StandardError; end 
  
  def initialize(size) 
    @buffer = Array.new(size)
    @size = size 
    @head = @tail = @counter = 0 
  end 

  def write(value)
    raise BufferFullException if full?
    @buffer[@head] = value 
    advance_head 
    @counter += 1     
  end 

  def write!(value)
    if full? 
      advance_tail 
      @counter -= 1
    end

    write(value)
  end
  
  def read 
    raise BufferEmptyException if empty?
    value = @buffer[@tail]
    @buffer[@tail] = nil 
    advance_tail
    @counter -= 1 
    
    value 
  end 

  def clear 
    @buffer = Array.new(@size)
    @head = @tail =  @counter = 0 
  end 

  private 
  def empty? = @counter == 0
  def full? = @counter == @size 
  def advance_head = @head = (@head + 1) % @size 
  def advance_tail = @tail = (@tail + 1) % @size 
end 