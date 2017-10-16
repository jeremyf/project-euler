# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#   a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# @see https://projecteuler.net/problem=9
SUM = 1000
# Largest a is a + (a + 1) + (a + 2) = 1000
a_max = (SUM - 3) / 3
1.upto(a_max) do |a|
  b_min = a + 1
  # Largest b (given a) is a + b + (b + 1) = 1000
  b_max = (SUM - 1 - a) / 2
  b_min.upto(b_max) do |b|
    # Set c (we only care about a + b + c = 1000)
    c = SUM - a - b
    if a**2 + b**2 == c**2
      puts "a: #{a}, b: #{b}, c: #{c}"
      puts "#{a * b * c}"
      break
    end
  end
end
