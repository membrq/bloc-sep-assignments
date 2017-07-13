require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)

    new_item = Node.new(key, value) #create new hash
    i = index(key, self.size)
    if @items[i] === nil #if index === nil
      list = LinkedList.new
      list.add_to_tail(new_item)
      @items[i] = list
    elsif @items[i].size < 5 #max load density = 5; should call size from linked_list
      @items[i].add_to_tail(new_item)
    #elsif (@items[i].key === key) && (@items[i].value != value)
    #  if @items[i].size < 5
    #    @items[i].add_to_tail(new_item)
    else #if load density is greater than or equal to 5
      self.resize
      self[key] = value
      #@items[i] = value
    end

    if self.load_factor > @max_load_factor #if load is greater than max load
      self.resize
      #self[key] = value
    end
  end

  def [](key)
    i = index(key, self.size)
    @items.each do |item|
      #if item != nil
      #  new_item = @items[i].find_node(key)
      #  if new_item.value != nil

      item = @items[i].find_node(key)
        if item.value != nil
          return item.value
        end
        #item = item.key
        puts item.key
        puts item.value
        #return item.value
      #  end
    #  end
    end
    #search linked items + return correct key
    #lookup is based on hash value first (to find 1st node in linked list), then find key
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

  # Calculate the current load factor
  def load_factor #number of total items / array length
    count = 0.0
    for i in 0..self.size-1
      if @items[i] != nil
        count += @items[i].size
    #@items.each do |list|
    #  if list != nil
    #    list.each do |item|
          #if item != nil
    #        item = item.key
    #        count += item.size
        #  end
    #    end
      end
    end
    (count / self.size).floor2(1)
    #sprintf('%.1f', count/size).to_f #returns string
  end

  # Simple method to return the number of items in the hash
  # return the sum of the sizes from the linked lists,
  # including nil entries (counts as 1) - Zac thinks,
  # otherwise those count as 0
  def size
    @items.length
  #  count = 0.0
    #for i in 0..self.size-1
  #  @items.each do |list|
  #    if list != nil
  #      list.each do |item|
          #if item != nil
  #          item = item.key
  #          count += item.size
        #  end
  #      end
  #    end
  #  end
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)

    old_array.each do |item|
      unless item === nil
        self[item.key] = item.value #assign value to key
      end
    end
  end
end

class Float
  def floor2(exp = 0)
   multiplier = 10 ** exp
   ((self * multiplier).floor).to_f/multiplier.to_f
  end
end
