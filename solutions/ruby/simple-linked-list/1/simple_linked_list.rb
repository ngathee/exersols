class Element 
  attr_accessor :datum, :next  
  def initialize(datum) 
    @datum = datum 
    @next = nil 
  end 
end 

class SimpleLinkedList 
  def initialize(data=nil)
    @head = nil

    if data
      data.each do |d| 
        push(Element.new(d))
      end
    end
  end 

  def push(element) 
    new_element = Element.new(element)
    if @head.nil?
      @head = new_element
    else 
      current = @head 
      while current.next
        current = current.next 
      end 
      current.next = new_element 
    end
    self  
  end

  def pop 
    return nil if @head.nil? 
    
    if @head.next.nil? 
      element = @head.datum 
      @head = nil 
      return element 
    end 
  
    current = @head 
    while current.next.next 
      current = current.next 
    end 
    element = current.next.datum 
    current.next = nil 
    element 
  end 

  def to_a 
    array = [] 
    current = @head 
    while current
      array.unshift(current.datum)
      current = current.next 
    end 
    array.map {|e| e.datum }
  end 

  def reverse! 
    previous = nil 
    current = @head 
    while current 
      next_node = current.next 
      current.next = previous 
      previous = current 
      current = next_node 
    end
    @head = previous 
    self 
  end
end 