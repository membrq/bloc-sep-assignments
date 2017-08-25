require 'benchmark'

def binary_search(collection, value, low, high)
  if (collection === nil) || (value === nil)
    return nil
  elsif collection.length === 1
    return collection[0]
  else
    mid = (low + high) / 2

    if collection[mid] < value
      newLow = mid
      newHigh = high
      binary_search(collection, value, newLow, newHigh)
    elsif collection[mid] > value
      newLow = low
      newHigh = mid
      binary_search(collection, value, newLow, newHigh)
    else
      return mid
    end
  end
end

puts Benchmark.measure{binary_search(collection,3,0,5)}
#0.000000   0.000000   0.000000 (  0.000209)
