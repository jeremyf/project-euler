# You are given the following information, but you may prefer to do
# some research for yourself.
#
# * 1 Jan 1900 was a Monday.
#   Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
# * A leap year occurs on any year evenly divisible by 4, but not on a
#   century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth
# century (1 Jan 1901 to 31 Dec 2000)?
# @see https://projecteuler.net/problem=19

def is_leap_year?(year)
  return false if year % 4 != 0
  return true if year % 400 == 0
  return false if year % 100 == 0
  true
end

LEAP_YEAR_DAYS = [31,29,31,30,31,30,31,31,30,31,30,31]
NON_LEAP_YEAR_DAYS = [31,28,31,30,31,30,31,31,30,31,30,31]

counter = 0
days_since_epoch = 0
(1900..2000).each do |year|
  days_per_month = is_leap_year?(year) ? LEAP_YEAR_DAYS : NON_LEAP_YEAR_DAYS
  days_per_month.each do |days_in_month|
    # Since the epoch started on a Monday (and we start at 0), then 6 days later will be Sunday
    # Also, the scope of the problem is after 1 Jan 1901, only check for years after 1901
    if days_since_epoch % 7 == 6 && year >= 1901
      counter += 1
    end
    # Since we only want the first day of the month, we can forward to the beginning of the next month.
    days_since_epoch += days_in_month
  end
end

puts counter
