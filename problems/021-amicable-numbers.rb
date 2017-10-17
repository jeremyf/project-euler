# Let d(n) be defined as the sum of proper divisors of n (numbers less
# than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable
# pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
# 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of
# 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
# @see https://projecteuler.net/problem=21
require_relative '../lib/factor_service'

def sum_of_proper_divisors_of(n)
  FactorService.proper_divisors_of(n).reduce(0, :+)
end

sum = 0
1.upto(9999) do |a|
  # Choosing variables to follow the above example
  b = sum_of_proper_divisors_of(a)
  next if b == a
  db = sum_of_proper_divisors_of(b)
  next unless db == a
  sum += b + a
end
# Need to divide by two because we encountered duplicates in our loop
# e.g. a was 220, which meant 220 and 284 were counted, then a was
# 284 which meant we counted 220 and 284 again
puts sum / 2
