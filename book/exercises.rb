# Create a class called MyCar. When you initialize a new instance or object of
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set to
# 0 during instantiation of the object to track the current speed of the car as
# well. Create instance methods that allow the car to speed up, brake, and shut
# the car off.

#Add a class method to your MyCar class that calculates the gas mileage of any car.


# Create a superclass called Vehicle for your MyCar class to inherit from and
# move the behavior that isn't specific to the MyCar class to the superclass.
# Create a constant in your MyCar class that stores information about the vehicle
# that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass
# that also has a constant defined that separates it from the MyCar class in
#some way.

class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@num_vehicles = 0

  def self.num_of_vehicles
    puts "There are #{@@num_vehicles} vehicles"
  end

  def initialize(year, color, model)
    @year = year
    @model = model
    @color = color
    @speed = 0
    @@num_vehicles += 1
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def shut_down
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(new_color)
    self.color = new_color
  end

  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def age
    puts "The car is #{calculate_age} years old"
  end

  private
  def calculate_age
     Time.now.year - self.year
  end
end

class MyCar < Vehicle
  def to_s
    "This is a MyCar. The color is: #{color}, the model is: #{model}, the year is: #{year}"
  end
end

module LoadAble
  def can_carry(kg)
    kg > 1000 ? "That's too much" : "No worries"
  end
end

class MyTruck < Vehicle
  attr_accessor :type
  TYPE = "Truck"

  include LoadAble

  def initialize(year, color, model)
    super(year, color, model)
    @type = TYPE
  end

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end



car = MyCar.new(1998, "red", "VW")
car.speed_up(10)
car.shut_down
car.spray_paint("blue")

MyCar.gas_milage(10, 100)
puts car

truck = MyTruck.new(1996, "blue", "Ram")
p truck.type
p truck.can_carry(999)

Vehicle.num_of_vehicles

# Print to the screen your method lookup for the classes that you have created.
p MyTruck.ancestors

puts truck

truck.age



# Create a class 'Student' with attributes name and grade. Do NOT make the grade
# getter public, so joe.grade will raise an error. Create a better_grade_than?
# method, that you can call like so...

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    @grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end


joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)
