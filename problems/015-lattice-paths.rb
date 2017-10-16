# Starting in the top left corner of a 2×2 grid, and only being able to
# move to the right and down, there are exactly 6 routes to the bottom
# right corner.
#
# @see https://projecteuler.net/problem=15
# @see http://www.robertdickau.com/lattices.html

def pascal_triangle(depth)
  return [1] if depth == 1
  previous_row = pascal_triangle(depth - 1)
  row = []
  previous_row.each_with_index do |cell, i|
    if i == 0
      row << previous_row[i] + 0
    else
      row << previous_row[i] + previous_row[i-1]
    end
  end
  row << 1
  row
end

# In a 2x2 square have three moves to get from one corner to another.
# Pascals triangle creates a triangle (and not a square). So we need
# to draw a square that can fit within the lattice of the triangle.
# Which means we need the triangle to be at least twice as many "steps"
# as the square. Plus we need a starting corner.
puts pascal_triangle(2+2+1).max
puts pascal_triangle(20+20+1).max
