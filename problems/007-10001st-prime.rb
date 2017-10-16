# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.
#
# What is the 10 001st prime number?
# @see https://projecteuler.net/problem=7
require 'prime'

STOP_AT = 10_001
hits = 0
i = 0
while STOP_AT > hits
  i += 1
  if Prime.prime?(i)
    hits += 1
  end
end
puts i
