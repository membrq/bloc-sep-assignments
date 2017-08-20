class Fibonacci

  def fib(n)
    return 0 if n === 0

    fib_0 = 0
    fib_1 = 1

    for (i = 1; i <= (n-1); i++)
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
    end
    return fib_1
  end

  puts fib(0)
  puts fib(1)
  puts fib(2)
  puts fib(3)
  puts fib(4)
  puts fib(5)
  puts fib(6)
  puts fib(7)
  puts fib(8)
  puts fib(9)

end
