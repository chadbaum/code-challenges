def collatz(num)
  sequence = [num]
  n = sequence.last

  while n != 1
    sequence << n / 2 if n.even?
    sequence << 3 * n + 1 if n.odd?
    n = sequence.last
  end

  sequence

end

def find_longest_collatz(start_range, end_range)
  raise ArgumentError if start_range == 0
  longest = 0
  (start_range..end_range).each do |num|
    longest = num if collatz(num).length > longest
  end
  longest
end

puts find_longest_collatz(1,1_000_000)
