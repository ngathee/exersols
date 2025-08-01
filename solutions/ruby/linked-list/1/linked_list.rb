class Node
  attr_accessor :data, :next, :previous 

  def initialize(data) 
    @data = data
  end 
end 

class Deque 
  def push(data) 
    new_node = Node.new(data) 
    if @head.nil? 
      @head = @tail = new_node 
    else 
      new_node.previous = @tail 
      @tail.next = new_node 
      @tail = new_node 
    end 
  end 

  def pop
    return nil if @head.nil?

    data = @tail.data 
    if @head == @tail 
      @head = @tail = nil 
    else 
      @tail = @tail.previous 
      @tail.next = nil 
    end 

    data 
  end 

  def shift 
    return nil if @head.nil?

    data = @head.data 
    if @head == @tail 
      @head = @tail = nil 
    else 
      @head = @head.next 
      @head.previous = nil 
    end 
    data 
  end 

  def unshift(data) 
    new_node = Node.new(data) 
    if @head.nil?
      @head = @tail = new_node 
    else
      new_node.next = @head 
      @head.previous = new_node 
      @head = new_node 
    end 
    data
  end 
end 

  