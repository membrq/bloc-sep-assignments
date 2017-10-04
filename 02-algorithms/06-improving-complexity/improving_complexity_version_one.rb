#code optimizations = pruning

# This method takes n arrays as input and combine them in sorted ascending  order
require 'benchmark'

def poorly_written_ruby(*arrays)
  sorted_array = []
  arrays.flatten.each do |item|
    length = sorted_array.length
    if length === 0
      sorted_array << item
    else
      i = 0
      while i < length
        val = sorted_array[i]
        if val > item
          sorted_array.insert(i, item)
          break
        elsif i === length - 1
          sorted_array << item
          break
        end
        i+=1
      end
    end
  end
  # Return the sorted array
  sorted_array
end

arrays = [3,4,2,8,[6,7],9]
poorly_written_ruby(arrays)
puts Benchmark.measure{poorly_written_ruby(arrays)}
# 0.000000   0.000000   0.000000 (  0.000007)
