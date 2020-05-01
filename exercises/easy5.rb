# Correct the following program so it will work properly.
# Assume that the Customer and Employee classes have complete implementations;
# just make the smallest possible change to ensure that objects of both types
# have access to the print_address method.

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode
  include Mailable
end

class Employee
  attr_reader :name, :address, :city, :state, :zipcode
  include Mailable
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address


# Correct the following program so it will work properly.
# Assume that the Car class has a complete implementation; just make the
# smallest possible change to ensure that cars have access to the drive method.
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive


# Modify the House class so that the above program will work.
# You are permitted to define only one new method in House.
class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

class Transform
  attr_reader :value
  def initialize(str)
    @value = str
  end

  def uppercase
    value.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')



class Wallet

  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end


class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "A #{type} named #{name}"
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    name
  end
end

class Shelter
  attr_reader :pets
  def initialize
    @pets = Hash.new
  end

  def adopt(owner, pet)
    owner.number_of_pets += 1
    if pets[owner] == nil
      pets[owner] = [pet]
    else
      pets[owner] << pet
    end
  end

  def print_adoptions
    pets.each do |name, pet|
      puts "#{name} has adopted the follwoing pets:"
      pet.each do |p|
        puts p
      end
      puts " "
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander



module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable
  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
   "#{title} #{name}"
 end

 def gait
   "struts"
 end
end



mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"


byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
