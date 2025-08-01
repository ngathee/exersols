class Element 
  attr_accessor :datum, :next 
  def initialize(datum) 
    @datum = datum 
    @next = nil 
  end 
end 

class SimpleLinkedList 
  def initialize(data=[])
    @tail = nil 
    data.each { |d| push(Element.new(d)) }
  end 

  def push(element) 
    if @tail 
      new_tail = element 
      new_tail.next = @tail 
      @tail = new_tail 
    else 
      @tail = element 
    end 
    self  
  end

  def pop 
    return nil if @tail.nil? 
    element = @tail
    new_tail = @tail.next 
    @tail = new_tail 
    element 
  end 

  def to_a 
    array = [] 
    current = @tail
    while current
      array.push(current.datum)
      current = current.next 
    end 
    array
  end 

  def reverse! 
    previous = nil 
    current = @tail 
    while current 
      next_node = current.next 
      current.next = previous 
      previous = current 
      current = next_node 
    end
    @tail = previous 
    self 
  end
end 