# using iteration for this solution
def fibs(n)
  fib_sequence = []
  (0..n).each do |n|
    if n < 2
      fib_sequence << n
    else
      fib_sequence << fib_sequence[-1] + fib_sequence[-2]
    end
  end
puts fib_sequence.last
end

fibs(0)
fibs(5)
fibs(55)

# solving the same problem recursively
def fibs_rec(n)
  n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end

puts fibs_rec(0)
puts fibs_rec(10)
