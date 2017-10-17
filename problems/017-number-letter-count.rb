# If the numbers 1 to 5 are written out in words: one, two, three,
# four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
# total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
# and forty-two) contains 23 letters and 115 (one hundred and fifteen)
# contains 20 letters. The use of "and" when writing out numbers is in
# compliance with British usage.
# @see https://projecteuler.net/problem=17
NUMBERS_TO_ENGLISH = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  1000 => 'one thousand'
}

TENS_TO_ENGLISH = {
  2 => 'twenty',
  3 => 'thirty',
  4 => 'forty',
  5 => 'fifty',
  6 => 'sixty',
  7 => 'seventy',
  8 => 'eighty',
  9 => 'ninety',
}

def number_to_english(value)
  return NUMBERS_TO_ENGLISH.fetch(value) if NUMBERS_TO_ENGLISH.key?(value)
  case value
  when (20..99)
    tens = value / 10
    ones = value % 10
    if ones == 0
      TENS_TO_ENGLISH.fetch(tens)
    else
      TENS_TO_ENGLISH.fetch(tens) + '-' + number_to_english(ones)
    end
  when (100..999)
    hundreds = value / 100
    tens_and_ones = value % 100
    if tens_and_ones == 0
      number_to_english(value / 100) + " hundred"
    else
      number_to_english(hundreds) + " hundred and " + number_to_english(tens_and_ones)
    end
  end
end

puts (1..1000).reduce(0) { |sum, i| sum + number_to_english(i).gsub(/[- ]*/, '').length }
