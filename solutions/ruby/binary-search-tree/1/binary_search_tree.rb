class TreeNode 
  attr_accessor :data, :left, :right 

  def initialize(data) 
    @data = data 
  end 
end 

class Bst   
  include Enumerable 
  
  def initialize(value)
    @root = TreeNode.new(value)  
  end 

  def data
    root.data 
  end 

  def left 
    root.left 
  end 

  def right 
    root.right 
  end 

  def insert(value)
    insert_helper(@root, value )  
    self 
  end 

  def each(&block) 
    return enum_for(:each) unless block_given? 
    inorder(root, &block) 
  end 

  private 
  attr_reader :root
  
  def insert_helper(node, data) 
    return TreeNode.new(data) if node.nil? 

    if data <= node.data 
      node.left = insert_helper(node.left, data) 
    else 
      node.right = insert_helper(node.right, data)
    end 

    node 
  end 

  def inorder(node , &block)
    return if node.nil? 
    
    inorder(node.left, &block)
    yield node.data if block_given? 
    inorder(node.right, &block)
  end 

end 