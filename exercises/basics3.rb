# Using the following code, create two classes - Truck and Car - that both
# inherit from Vehicle.
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# Change the following code so that creating a new Truck automatically
# invokes #start_engine.
class Vehicle4
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck4 < Vehicle4
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck4.new(1994)
puts truck1.year

# Using the following code, allow Truck to accept a second argument upon
# instantiation. Name the parameter bed_type and implement the modification so
# that Car continues to only accept one argument.
class Vehicle3
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck3 < Vehicle3
  attr_reader :bed_type
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car3 < Vehicle3
end

truck1 = Truck3.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type



# Given the following code, modify #start_engine in Truck by appending
# 'Drive fast, please!' to the return value of #start_engine in Vehicle.
# The 'fast' in 'Drive fast, please!' should be the value of speed.
class Vehicle2
  def start_engine
    'Ready to go!'
  end
end

class Truck2 < Vehicle2
  def start_engine(speed)
    super() + speed
  end
end

truck1 = Truck2.new
puts truck1.start_engine('fast')

# Using the following code, create a Towable module that contains a method
# named tow that prints I can tow a trailer! when invoked. Include the module
# in the Truck class.
module Towable
  def tow
    puts "I can tow a trailer"
  end
end

class Truck6
  include Towable
end

class Car6
end

truck1 = Truck6.new
truck1.tow

# Using the following code, create a class named Vehicle that,
# upon instantiation, assigns the passed in argument to @year. Both Truck and
# Car should inherit from Vehicle.
class Vehicle7
  attr_accessor :year

  def initialize(year)
    @year = year
  end
end

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck7 < Vehicle7
  include Towable
end

class Car7 < Vehicle7
end

truck1 = Truck7.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car7.new(2006)
puts car1.year

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes that were checked by Ruby when searching
# for the #color method.
class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
p Cat.ancestors #Cat, Animal (stop here as method is defined in Animal)


# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes and modules that Ruby will check when
# searching for the #color method.
class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color
p Cat.ancestors #all parents as color isn't defined anywhere

# Using the following code, determine the lookup path used when invoking
# bird1.color. Only list the classes or modules that were checked by Ruby when
# searching for the #color method.
module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
p Bird.ancestors # Bird, Flyable, Animal

# Create a module named Transportation that contains three classes:
# Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.
module Transportation
  class Vehicle8
  end
  
  class Truck8 < Vehicle8
  end

  class Car8 < Vehicle8
  end
end
