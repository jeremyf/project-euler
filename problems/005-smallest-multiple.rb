# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all
# of the numbers from 1 to 20?
#
# @see https://projecteuler.net/problem=5
require_relative '../lib/factor_service'

result = 1
(1..20).each do |i|
  result = result * i / FactorService.gcd(result,i)
end
puts result
