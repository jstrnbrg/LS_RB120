class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

entry = InvoiceEntry.new("Ball", 1)
p entry
entry.update_quantity(2)
p entry



# Create a class called Greeting with a single method called greet that takes a
# string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello
# and one called Goodbye. The Hello class should have a hi method that takes no
# arguments and prints "Hello". The Goodbye class should have a bye method to
# say "Goodbye". Make use of the Greeting class greet method when implementing
# the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye
# classes.
class Greeting
  def greet(str)
    puts str
  end
end

class Hello < Greeting
  def hi
     greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end



class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type ? filling_type : "Plain"
    @glazing = glazing ? "with #{glazing}" : ""
  end

  def to_s
    "#{@filling_type} #{@glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5
