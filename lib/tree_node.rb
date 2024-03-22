class PolyTreeNode
    require 'byebug'
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  attr_reader :value, :parent, :children
  


  def parent=(parent_name)
    
    old_parent = @parent
    
        
    @parent = parent_name
    unless parent_name == nil || parent.children.include?(self)
        @parent.children << self
    end

    if old_parent
    
        index = old_parent.children.index(self)
        
        old_parent.children = old_parent.children[0...index] + old_parent.children[index + 1..-1]
    end

  end

    # A is parent to B, B is child of A
    def add_child(child_node)
      child_node.parent = self
    end

    #A is parent to B. Remove B from A.  A.remove_child(B)

    def remove_child(child_node)

        if !self.children.include?(child_node)
          raise "Not a parent"
        end
      
        child_node.parent = nil
    end

   



  def inspect
    @value.inspect

  end
end