require 'benchmark'

class Heap

  def initialize(size)
    @items = Array.new(size)
  end

  def insert(node, index) #add to end of array
    @items[index] = node
  end

  def parent(index)
    return ((index-2)/2).floor
  end

  def left_child(index)
    return index*2+1
  end

  def right_child(index)
    return index*2+2
  end

  def print
    @items.each do |item|
      puts item
    end
  end

  def heapify(count)
    start = parent(count-1)

    while start >= 0
      sift_down(start, count-1)
      start = start-1
    end
  end

  def sift_down(start, last)
    root = start

    if @items[root] === nil
      return nil
    end

    while left_child(root) != nil && left_child(root) <= last
      child = left_child(root)
      puts "This is the child index: #{child}"

      if (child+1) <= last && @items[child] < @items[child+1]
        child = child + 1
      end

      if @items[root] < @items[child]
        swap(root, child)
      else
        return
      end
      root = child
    end
  end

  def swap(index1, index2)
    @items[index1], @items[index2] = @items[index2], @items[index1]
  end

  def heapsort(count)
    heapify(count)
    last = count-1

    while last > 0
      swap(last, 0)
      last = last-1
      sift_down(0, last)
    end
  end
end


my_heap = Heap.new(0)
my_heap.insert(25, 0)
my_heap.insert(74, 1)
my_heap.insert(2, 2)
my_heap.insert(1, 3)
my_heap.insert(34, 4)
my_heap.insert(99, 5)
my_heap.insert(65, 6)
my_heap.heapsort(7)
my_heap.print
puts Benchmark.measure{my_heap.heapsort(7)}
#0.000000   0.000000   0.000000 (  0.000410)
