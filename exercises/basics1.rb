# Update the following code so that, instead of printing the values, each
# statement prints the name of the class to which it belongs.
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end


class Cat
  attr_accessor :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def greet
    puts "My name is #{name}"
  end
end

kitty = Cat.new("Harry")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk

#Create an empty class named Cat.
# (see above)

# Using the code from the previous exercise, create an instance of Cat and
#  assign it to a variable named kitty.
# (see above)

# Using the code from the previous exercise, add an #initialize method that
# prints I'm a cat! when a new Cat object is initialized.
# (see above)

# Using the code from the previous exercise, add a parameter to #initialize that
# provides a name for the Cat object. Use an instance variable to print a greeting
# with the provided name. (You can remove the code that displays I'm a cat!.)
# (see above)

# Using the code from the previous exercise, move the greeting from the
# #initialize method to an instance method named #greet that prints a greeting
# when invoked.
# (see above)

# Using the code from the previous exercise, add a getter method named #name and
# invoke it in place of @name in #greet.
# (see above)


# Using the code from the previous exercise, add a setter method named #name.
# Then, rename kitty to 'Luna' and invoke #greet again.
# (see above)

# Using the following code, create a module named Walkable that contains a
# method named #walk. This method should print Let's go for a walk! when invoked.
# Include Walkable in Cat and invoke #walk on kitty.
