# The sum of the squares of the first ten natural numbers is:
#
#   1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is:
#
#   (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.
#
# @see https://projecteuler.net/problem=6

RANGE = (1..100)
sum_of_the_squares = RANGE.reduce(0) { |sum, i| sum + i ** 2 }
square_of_the_sum = ((RANGE.size * (RANGE.first + RANGE.last)) / 2) ** 2
puts square_of_the_sum - sum_of_the_squares
