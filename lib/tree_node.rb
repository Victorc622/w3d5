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
    if old_parent && !old_parent.children.include?(self)
        index = old_parent.children.index(self)
        
        old_parent.children = old_parent.children[0...index] + old_parent.children[index + 1..-1]
        end
  end

  def inspect
    @value.inspect

  end
end