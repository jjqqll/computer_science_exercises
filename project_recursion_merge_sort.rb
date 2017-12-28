unsorted_ary = 9.times.collect {rand(0..100)}

# merge sort == divide and conquer
def merge_sort(ary)
# base case
  return ary if ary.size < 2

# divide(recursively dividing the array)
  left = merge_sort(ary[0...ary.size/2])
  right = merge_sort(ary[ary.size/2...ary.size])

  sorted = []
# conquer(sort)
  while left.length > 0 && right.length > 0
#  until left.empty? || right.empty? # until one array is empty. In other words, when both are not empty.
    sorted << (left.first > right.first ? right.shift : left.shift)
  end

# if one of the array is empty, add the other array to the sorted list
  left.empty? ? sorted += right : sorted += left
end

print "merge sort: #{merge_sort(unsorted_ary)}\n\n"

# recursive bubble sort
def bubble_sort(ary)
    #(ary.size-1).times do
    swapped = false
      (0...ary.length-1).each do |idx|
        if ary[idx] > ary[idx+1]
          ary[idx], ary[idx+1] = ary[idx+1], ary[idx]
          swapped = true
        end
      end
    if swapped == false
      return ary
    else
      bubble_sort(ary)
    end
    ary
end

print "bubble sort(recursive): #{bubble_sort(unsorted_ary)}\n\n"

# non-recursive bubble sort
def bubble_sort(ary)
  #(ary.size-1).times do
    until ary == ary.sort
      (0...ary.length-1).each do |idx|
        if ary[idx] > ary[idx+1]
          ary[idx], ary[idx+1] = ary[idx+1], ary[idx]
          swapped = true
        end
      end
    end
  ary
end

print "bubble sort(non-recursive): #{bubble_sort(unsorted_ary)}\n\n"

def sorted(ary)
  return [] if ary.length == 0

  element_divide = ary.shift
  first, second = ary.partition { |x| x < element_divide }
  sorted(first) + [element_divide] + sorted(second)
end
print "sort: #{sorted(unsorted_ary)}\n"
