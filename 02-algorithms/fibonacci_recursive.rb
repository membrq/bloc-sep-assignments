require 'benchmark'

def fib(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fib(n-1) + fib(n-2)
  end
end

puts Benchmark.measure{fib(20)}
#0.000000   0.000000   0.000000 (  0.001420)
