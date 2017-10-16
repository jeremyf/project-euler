# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#
# @see https://projecteuler.net/problem=3

def divide(dividend, i, divisors)
  return dividend unless dividend % i == 0
  divisors << i
  dividend = dividend / i
  divide(dividend, i, divisors)
end

VALUE = 600851475143
dividend = VALUE
divisors = []
(2..VALUE).each do |i|
  dividend = divide(dividend, i, divisors)
  break if dividend < i
end

puts divisors.sort.last
