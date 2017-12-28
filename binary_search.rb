=begin
similar to merge sort's divide and conquer method. Binary search's
method is to divide and eliminate
    Pseudo-code
    1. Let min = 0 and max = n-1.
    2. If max < min, then stop: target is not present in array. Return -1.
    3. Compute guess as the average of max and min, rounded down (so that it is an integer).
    4. If array[guess] equals target, then stop. You found it! Return guess.
    5. If the guess was too low, that is, array[guess] < target, then set min = guess + 1.
    6. Otherwise, the guess was too high. Set max = guess - 1.
    7. Go back to step 2.
=end

def binary_search(ary, target)
  min = 0
  max = ary.length - 1

  while min <= max
    midpoint_idx = (min + max)/2
    if ary[midpoint_idx] == target
      return midpoint_idx
    elsif ary[midpoint_idx] < target
      min = midpoint_idx + 1
    else
      max = midpoint_idx - 1
    end
  end
  return "Target is not in array."
end

array = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
    		41, 43, 47, 53, 59, 61, 67, 71, 72, 73, 79, 83, 89, 97]

puts binary_search(array, 72)
puts binary_search(array, 75)
