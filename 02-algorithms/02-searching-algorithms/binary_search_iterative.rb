require 'benchmark'

def binary_search(collection, value)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high)/2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return mid
    end
  end

  return nil

end

puts Benchmark.measure{binary_search(collection, 3)}
#0.000000   0.000000   0.000000 (  0.000004)
