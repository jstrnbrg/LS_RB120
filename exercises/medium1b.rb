class Machine
  attr_reader :switch
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# machine = Machine.new
# machine.start
# machine.stop
# p machine.switch


class FixedArray
  attr_reader :size
  def initialize(n)
    @size = n
    @array = initialize_array(size)
  end

  def initialize_array(n)
    n.times.with_object([]) do |_, obj|
      obj << nil
    end
  end

  def [](ind)
    @array.fetch(ind)
  end

  def []=(ind, val)
    @array.fetch(ind) #raises IndexError
    @array[ind] = val
  end

  def to_a
    @array.clone
  end

  def to_s
    @array.to_s
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
#
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
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end


class CircularQueueItem
  attr_reader :id, :value
  def initialize(v, id)
    @value = v
    @id = id
  end
end

class CircularQueue
  @@current_item_id = 0
  attr_accessor :items
  attr_reader :current_item_id, :size

  def initialize(n)
    @size = n
    @items = []
  end

  def enqueue(value)
    if items.size < size
      self.items << CircularQueueItem.new(value, @@current_item_id)
      increase_item_id
    else
      dequeue
      self.items << CircularQueueItem.new(value, @@current_item_id)
      increase_item_id
    end
  end

  def dequeue
    return nil if items.empty?
    item = oldest_item
    items.delete(item)
    item.value
  end

  private

  def oldest_item
    items.min_by {|item| item.id}
  end

  def increase_item_id
    @@current_item_id += 1
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
