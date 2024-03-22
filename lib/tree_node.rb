class PolyTreeNode
    require 'byebug'
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  attr_writer :children
  attr_reader :value, :parent, :children
  


  def parent=(parent_name)
    
    if @parent && @parent.children.include?(self)
    
        index = @parent.children.index(self)
        
        @parent.children = @parent.children[0...index] + @parent.children[index + 1..-1]
    end
        
    @parent = parent_name
    unless parent_name == nil || parent.children.include?(self)
        @parent.children << self
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

   def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value) 
      
      return result if result != nil
    end
      return nil
   end

   def bfs(target_value)
    q = [self]

    until q.empty?
    
      test = q.shift
      if test.value == target_value
        return test
      else
        q += test.children
      end
    end
    return nil
   end



  def inspect
    @value.inspect

  end
end

