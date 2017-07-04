require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
  end

  def [](key)
    @items[index(key, size)]
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    result = 0
    key.each_byte do |letter| #converts characters to ascii values
      result += letter #adds ascii values to result
    end
    result % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    #loop through @items or check index var only?
    if index != nil
      return -1
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
  end
end
