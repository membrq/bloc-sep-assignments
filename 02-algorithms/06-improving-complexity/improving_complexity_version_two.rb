#improves time complexity

# This method takes n arrays as input and combine them in sorted ascending  order
require 'benchmark'

def poorly_written_ruby(*arrays)
  sorted_array = arrays.flatten.sort
end


arrays = [3,4,2,8,[6,7],9]
poorly_written_ruby(arrays)
puts Benchmark.measure{poorly_written_ruby(arrays)}
# 0.000000   0.000000   0.000000 (  0.000005)
