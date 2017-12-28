=begin
 **selection sort**

 Pseudo Code
 1. for i from 0 to n-1
 2. find the lowest number between i'th and n-1'th number
 3. swap the lowest number with the i'th number
 OR
 1. find the smallest, swap it with the first
 2. find the second smallest, swap it to the second
 3. repeat..

 running time efficiency: O(n^2)
 example with 8 numbers:
 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 = 36 (loops 36 times)
 This is the same as 4 * 9 = 36 => n/2 * (n+1) => n^2/2 + n/2
=end

def selection_sort(array)
  n = array.length
  for i in 0...array.length
    for j in (i+1)...array.length
      if array[j] < array[i]
        temp_min = array[j] # holding mininum number temporarily
        array[j] = array[i] # swap beginning number to the back
        array[i] = temp_min # swap minimum number to the beginning
      end
    end
  end
  return array
end

def selection_sort2(array)
  n = array.length-1
  n.times do |i|
    (i+1).upto(n) { |j| array[i], array[j] = array[j], array[i] if array[j] < array[i] }
  end
  array
end

=begin
 **Insertion sort**

 Pseudo Code
 1. for i in 1 to n-1
 2. compare card i to the cards on the left subarray
 3. insert card into the correct place

 Running time efficiency
 Theta(n^2): when array is in reverse sorted order [11, 8, 5, 3, 2]
 Theta(n): when array starts out already sorted or almost sorted. so no or few elements need to slide to the right
 O(n^2): average case 

=end

def insertion_sort(array)
  start = 1
  for i in start...array.length
    key = array[i]
    (start-1).downto(0) do |j|
      if array[j] >= key  # if 'key' is less than an element to its left, that element will
        array[j+1], array[j] = array[j], key # slide to the right to take "key's" position
      end
    end
  end
  array
end

print "#{random_array = 10.times.collect {rand(0...100)}}\n"
print "selection_sort: #{selection_sort(random_array)}\n"
print "selection_sort2: #{selection_sort2(random_array)}\n"
print "insertion_sort: #{insertion_sort(random_array)}\n"
