# Creating a global cache
@cache = {1 => 1}

# With recursion, we'll be walking to the end of sequence to determine n's total length
# As we then walk backwards with the answer for the original n, we cache the intermediary
# answers for numbers in that sequence.
#
# To get the length of 4, we go 4 -> 2 -> 1
# As we walk back from 1, we set 2 (which is the one plus length of the sequence for 1)
# Then we set 4 (which is one plus the length of the sequence for 2)
def collatz(n,length=0)
  return @cache[n] + length if @cache.key?(n)
  next_num = 0
  return_value = nil
  if n.even?
    next_num = n/2
    return_value = collatz(next_num,length + 1)
  else
    next_num = (3 * n ) + 1
    return_value = collatz(next_num, length + 1)
  end
  @cache[n] ||= @cache[next_num] + 1
  return return_value
end

largest_collatz = 0
number_with_longest_collatz = 0

(1..1_000_000).each do |i|
  current_collatz = collatz(i)
  if current_collatz > largest_collatz
    largest_collatz = current_collatz
    number_with_longest_collatz = i
  end

end

puts number_with_longest_collatz
