# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
# @see https://projecteuler.net/problem=10
require 'prime'
puts (1...2_000_000).reduce(0) { |sum, i| sum + (Prime.prime?(i) ? i : 0) }
