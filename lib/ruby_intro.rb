
# BORA ERINC
# Tuesday 3 feb 2026

# Part 1

def sum(arr)
  # idiomatic ruby:
  # arr.sum
  # to prove I'm not being lazy:
  arr.reduce(0) { |acc, num| acc + num }
end

def max_2_sum(arr)
  # idiomatic + ruby finds top k in O(n)
  arr.max(2).sum
end

def sum_to_n?(arr, n)
  # if length less than two, can't be valid two sum
  return false if arr.length < 2

  # for each element, if target (n - num) seen, return true
  # otherwise add it. We are guaranteed because for each
  # possible valid answer, if haven't seen its pair on the first,
  # we will on the second
  hashmap = {}
  arr.each do |num|
    return true if hashmap.key?(n - num)
    hashmap[num] = true
  end

  # default to false
  return false
end

# Part 2

def hello(name)
  # idiomatic ruby string concat
  "Hello, #{name}"
end

def starts_with_consonant?(s)
  # check if nil or length < 1
  return false if s == nil or s.length < 1 
  # regex char for consonants, case INSENSITIVE
  s[0].match?(/[b-df-hj-np-tv-z]/i)
end

def binary_multiple_of_4?(s)
  # false on nil or if string doesn't match binary regex
  return false if s == nil or not s.match?(/^[01]+$/)
  # use to_i method and base (2) to get int
  s.to_i(2) % 4 == 0
end

# Part 3

class BookInStock

  # specify getters and setters
  attr_reader :isbn, :price
  attr_writer:isbn, :price

  # constructor
  def initialize(isbn, price)
    # throw if nil or length < 1
    raise ArgumentError, "ISBN can't be the empty string" if isbn == nil or isbn.length < 1
    # throw if not numeric
    raise ArgumentError, "Price must be numberic and >0" unless price.is_a?(Numeric) and price > 0 

    @isbn = isbn
    @price = price
  end

  def price_as_string()
    # use ruby built in format + string concat
    return "$#{format("%.2f", @price)}"
  end
end
