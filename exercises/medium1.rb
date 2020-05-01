class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private
  attr_writer :switch
  def flip_switch(desired_state)
    switch = desired_state
  end
end


# A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed-length array, and provides the necessary
# methods to support the following code:
class FixedArray
  attr_reader :values
  def initialize(max_size)
    @values = Array.new(max_size)
  end

  def to_a
    @values.clone
  end

  def [](n)
    raise IndexError if n > values.size
    values[n]
  end

  def []=(n, arg)
    raise IndexError if n > values.size
    values[n] = arg
  end

  def to_s
    to_a.inspect
  end
end


# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5
#
# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
#
# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
#
# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
#
# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
#
# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end
#
# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end
#
# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end





class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name,year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end


class CircularQueue
  attr_reader :count, :items, :max
  def initialize(n)
    @count = 0
    @max = n
    @items = [] 
  end

  def initialize_items(n)
    result = []
    n.times do
      result << Item.new(nil, @count)
      @count += 1
    end
    result
  end

  def dequeue
    return if items.size == 0
    item = items.min_by {|item| item.position}
    items.delete(item).value
  end

  def enqueue(value)
    item = Item.new(value, @count)
    if items.size < max
      items << item
    else
      dequeue
      items << item
    end
    @count += 1
  end
end

class Item
  attr_reader :position, :value
  def initialize(value, position)
    @value = value
    @position = position
  end
end



queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
