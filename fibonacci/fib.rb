def recursive_fib(num)

  return num if num < 2
  recursive_fib(num -1) + recursive_fib(num -2)

end

@cache = []
def recursive_fib_2(num)

  return num if num < 2

  a = @cache[num - 1]
  b = @cache[num - 2]
  if a.nil?
    a = recursive_fib(num - 1)
    @cache[num - 1] = a
  end
  if b.nil?
    b = recursive_fib(num - 2)
    @cache[num - 2] = b
  end
  a + b

end


def iterative_fib(num)
  return 0 if num == 0
  return 1 if num == 1

  sequence = [0,1]

  while sequence.length <= num
    sequence << sequence[-1] + sequence[-2]
  end

  sequence.last

end

puts "RECURSIVE"
puts recursive_fib(0)
puts recursive_fib(1)
puts recursive_fib(2)
puts recursive_fib(3)
puts recursive_fib(4)
puts recursive_fib(5)
puts recursive_fib(6)
puts recursive_fib(7)
puts recursive_fib(8)
puts recursive_fib(9)
puts "------------------"
puts "ITERATIVE"
puts iterative_fib(0)
puts iterative_fib(1)
puts iterative_fib(2)
puts iterative_fib(3)
puts iterative_fib(4)
puts iterative_fib(5)
puts iterative_fib(6)
puts iterative_fib(7)
puts iterative_fib(8)
puts iterative_fib(9)
puts "------------------"
puts "BENCHMARK"

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end
