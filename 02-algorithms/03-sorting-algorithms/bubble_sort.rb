require 'benchmark'

def bubble_sort(collection)
  n = collection.length

  loop do
    swapped = false

    (n-1).times do |item|
      if collection[item] > collection[item + 1]
        temp = collection[item]
        collection[item] = collection[item + 1]
        collection[item + 1] = temp
        swapped = true
      end
    end
    break unless swapped #syntax?
  end

  collection
end

collection = [5,34,2,7,9,3,4]
bubble_sort(collection)

puts Benchmark.measure{bubble_sort(collection)}
#0.000000   0.000000   0.000000 (  0.000005)
