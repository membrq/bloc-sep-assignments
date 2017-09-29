require 'benchmark'

class QuickSort

  def initialize(array)
    @array = array
  end

  def sort()
    quick(@array,0,@array.size-1)
    puts @array
  end

  private

  def quick(array, left, right)
    if left < right
      pivot = partition(array, left, right)
      quick(array, left, pivot-1)
      quick(array, pivot+1, right)
    end
  end

  def partition(array, left, right)
    x = array[right]
    i = left-1
    for j in left..right-1
      if array[j] <= x
        i += 1
        array[i], array[j] = array[j], array[i]
      end
    end
    array[i+1], array[right] = array[right], array[i+1]
    i+1
  end
end

my_array = [5,34,2,7,60,1,0,9,3,4]
sorted_array = QuickSort.new(my_array)
puts sorted_array.sort()
puts Benchmark.measure{sorted_array.sort()}
#0.000000   0.000000   0.000000 (  0.000182)
