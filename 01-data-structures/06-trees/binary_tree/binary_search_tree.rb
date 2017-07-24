require_relative 'node'

class BinarySearchTree

  #what ruby methods avail to tree? array or hash methods?

  def initialize(root)
    @root = root
  end

  #finds empty "leaf" for node
  def insert(root, node) #assumes tree already has root
    if node.rating < root.rating
      if root.left === nil
        root.left = node
      else #left subtree; not original root
        insert(root.left, node)
      end
    elsif node.rating > root.rating
      if root.right === nil
        root.right = node
      else
        insert(root.right, node)
      end
    end
  #end
  end

  # Recursive Depth First Search
  # returns Node object if data is found
  def find(root, data) #like a stack

    #check for nil
    #if root is nil, add data to root
    #elsif root.left is nil, add data to root.left
    #elsif root.left != nil AND root.left.left is nil, add data to root.left.left
    #elsif root.right is nil, add data to root.right
    #elsif root.right != nil AND root.right.right is nil, add data to root.right.right
    #Q: if you continue down all left branches first, how do you know how many branches to search?

    if data === nil #if data is nil
      #is this condition necessary?
      return nil
    elsif root.title === data #if root matches data
      return root
    elsif root.title != data && root.left === nil #if root is dif from data and left is empty
      if root.right === data
        return root.right
      elsif root.right === nil
        return nil
      else
        find(root.right, data)
      end
    elsif root.title != data && root.left != nil #if root is dif from data and left is not empty
      if root.left === data
        return root.left
      else
        find(root.left, data)
      end
    end
  end

  def delete(root, data)
    #how to check that tree remains after deletion?
    if data === nil
      return nil
    else
      node = self.find(root, data)
      if node === nil
        return nil
      else
        node.title = nil
        node.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  # prints each node's data from top to bottom
  def printf(children=nil) #like a queue
    #what is the param being passed??
    array = [@root]  #begin array with @root as 1st item
    output = []
    while array.length > 0
      node = array.shift #returns 1st element of self + returns it
      if node.left != nil #if left leaf of child has content
        array.push(node.left) #push that leaf to the array
      end
      if node.right != nil
        array.push(node.right)
      end
      output.push("#{node.title}: #{node.rating}") #push title/rating for each child to output array
    end
    output.each {|movie| puts movie} #print each item in output array
  end
end
