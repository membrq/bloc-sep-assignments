class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end

class MinHeap
  attr_accessor :node

  def initialize(size)
    @items = Array.new(size)
  end

  def bubble_up(index)
    parent_index = (index / 2)

    #if the parent is already greater than the child
    return if @items[parent_index].rating <= @items[index].rating

    #otherwise we exchange the child with the parent
    swap(index, parent_index)

    #and keep bubbling up
    bubble_up(parent_index)
  end

  def insert(node)
    if @items.empty?
      @items.push(node)
    end

    root = @items[0]

    if !@items.empty?
      if node.rating < root.rating
        @items.push(node) #insert node at last index position
        puts "Test"
        bubble_up(@items.size-1)
      elsif node.rating > root.rating
        @items.push(node)
        bubble_up(@items.size-1)
      end
    else
      return nil
    end
  end

  def swap(root, node)
    @items[root], @items[node] = @items[node], @items[root]
  end

  def find(node)
    @items.each_with_index do |item, index|
      if item.title === node.title
        puts "I found the item! #{item.title}"
        puts "Here is the item's index position: #{index}"
      end
    end
  end

  def delete(root, node)
    @items.each_with_index do |item, index|
      if item.title === node.title
        @items.delete(item)
      end
    end
    bubble_up(@items.size-1)
    return @items
  end

  def print
    @items.each do |item|
      puts item.title
    end
  end
end

my_movies = MinHeap.new(0)
root = Node.new("Lion", 98)
movie_1 = Node.new("Beasts of No Nation", 91)
movie_2 = Node.new("Avatar", 83)
movie_3 = Node.new("Okja", 85)
movie_4 = Node.new("Star Wars", 90)
my_movies.insert(root)
my_movies.insert(movie_1)
my_movies.insert(movie_2)
my_movies.insert(movie_3)
my_movies.insert(movie_4)
my_movies.print
my_movies.find(movie_4)
my_movies.delete(root, movie_2)
