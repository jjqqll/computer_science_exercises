def factorial(n)
  return "undefined" if n < 0
  return 1 if n < 2   # base case
  factorial(n-1) * n  # getting closer to base case
end

puts factorial(-2)
puts factorial(0)
puts factorial(1)
puts factorial(3)
puts factorial(5)
puts factorial(10)

=begin
  Pseudocode
  1. if string has no letter or just one letter, then it is a palindrome
  2. otherwise, compare the first and last letters
  3. if the first and last letters are different, then it is NOT a palindrome
  4. if the first and last letters are the same, the new string will be the
     remaining letters excluding the original first and last letters.
  5. repeat step 2 

=end

def palindrome(str)
  return true if str.size == 1 || str.size == 0  # base case
  if str[0] == str[-1]
    palindrome(str[1..-2])  # getting closer to base case
  else
    false
  end
end

puts palindrome("")
puts palindrome("a")
puts palindrome("abcdcba")
puts palindrome("abcde")

def bottles(n)
  if n == 0
    puts "no more bottles of beer on the wall"
  else
    puts "#{n} bottles of beer on the wall"
    bottles(n-1)
  end
end

bottles(0)
bottles(1)
bottles(3)
bottles(5)

def fib_value(n)
  return n if n == 0 || n == 1
  fib_value(n-1) + fib_value(n-2) if n > 1
end

puts fib_value(5)
puts fib_value(6)
puts fib_value(7)
puts fib_value(8)

def fibinacci(n)
  sequence = []
  (0..n).each do |n|
    if n < 2
      sequence << n
    else
      sequence << sequence[-1] + sequence[-2]
    end
  end
  sequence.last
end

puts fibinacci(5)
puts fibinacci(6)
puts fibinacci(7)
puts fibinacci(8)

def flatten(array, result=[])
  array.each do |element|
    if element.is_a?(Array)
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

print flatten([[1, 9], [3,4]], [])
print flatten([[1, [8,9]], [3,4]], [])


def integer_to_roman(roman_mapping, number, result="")
  return result if number == 0  # base case
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0 # getting closer to base case modulus(number) is getting smaller
  end
end

print integer_to_roman({
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I",
}, 902, "")

def roman_to_integer(roman_mapping, str, result=0)
  return result if str.empty? # base case
  roman_mapping.keys.each do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(roman_mapping, str, result) # getting closer to base case str is getting smaller
    end
  end
end

print roman_to_integer({
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}, "CMII", 0)
