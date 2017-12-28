# a linked list's elements can easily be inserted or removed
# without reallocating other elements.

# Node class, containing a #value method and a link to the #next_node
class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# creating a list with first and last elements and size
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

# adds a new node to the end of the list
  def append(data = nil)
    # check if the list is empty
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
    # change the pointer to the next Node
      @tail.next_node = Node.new(data)
      @tail = @tail.next_node # newly added data becomes the tail
    end
    @size += 1
  end

# adds a new node to the beginning of the list
  def prepend(data)
    node = Node.new(data)
    # check if the list is empty
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
      node.next_node = @head # new node is pointing to the old @head
      @head = node # new node becomes the new @head
    end
    @size += 1
  end

# returns the total number of nodes in the list
  def size
      @size
  end

# returns the first node in the list
  def head
    @head.value
  end

# returns the last node in the list
  def tail
    @tail.value
  end

# returns the node at the given index
  def at(index)
    i = 0
    pointer = @head
    until i == index
      return if pointer.next_node == nil
      pointer = pointer.next_node
      i += 1
    end
    pointer
  end

# removes the last element from the list
  def pop
    pointer = @head
    until pointer.next_node == @tail # loop to the node before @tail
			pointer = pointer.next_node
		end
		pointer.next_node = nil # make tail equal to nil
		@tail = pointer # the node before @tail becomes the new tail.
    @size -= 1
  end

# returns true if the passed in value is in the list, otherwise false.
  def contains?(value)
    pointer = @head
    # loop until last node
    until pointer == nil
      # return true if the value of the pointer is equal to the value passed
      return true if pointer.value == value
      # otherwise move the pointer to the next node
      pointer = pointer.next_node
    end
    return false
  end

# returns the index of the node containing data, otherwise return nil
  def find(data)
    i = 0
    pointer = @head
    # loop until last node
    until pointer == nil
      return i if pointer.value == data
      pointer = pointer.next_node
      i += 1
    end
    'nil'
  end

# represent LinkedList object as strings as: ( data ) -> ( data ) -> nil
  def to_s
    pointer = @head
    # loop until last node to print the values
    until pointer == nil
      print "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    print "nil\n"
  end

# inserts the node at the given index
  def insert_at(data, index)
    node = Node.new(data)
    node.next_node = at(index)
    at(index-1).next_node = node
    @size += 1
  end

# removes the node at the given index
  def remove_at(index)
    at(index-1).next_node = at(index+1) # the link is updated to point to the node at index+1
    @size -= 1
  end
end


mylist = LinkedList.new
mylist.to_s
mylist.append("A")
mylist.prepend("B")
mylist.append("C")
mylist.prepend("D")
mylist.prepend("Z")
mylist.to_s
puts "tail: #{mylist.tail}"
mylist.pop
mylist.pop
mylist.to_s
puts "size: #{mylist.size}"
puts "head: #{mylist.head}"
puts "tail: #{mylist.tail}"
puts "at(2): #{mylist.at(2).value}"
puts "contains?('Z'): #{mylist.contains?("Z")}"
puts "contains?('H'): #{mylist.contains?("H")}"
puts "find('C'): #{mylist.find("C")}"
puts "find('B'): #{mylist.find("B")}"
mylist.remove_at(1)
mylist.to_s
mylist.insert_at("F", 1)
mylist.to_s
