# Add the appropriate accessor methods to the following code.


class Person1
  attr_accessor :name
end

person1 = Person1.new
person1.name = 'Jessica'
puts person1.name

# Add the appropriate accessor methods to the following code.
class Person2
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person2.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

# Modify the following code so that the value of @phone_number can't
# be modified outside the class.
class Person3
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person3.new(1234567899)
puts person1.phone_number

#person1.phone_number = 9987654321
puts person1.phone_number


# Using the following code, add the appropriate accessor methods.
# Keep in mind that the last_name getter shouldn't be visible outside the class,
# while the first_name getter should be visible outside the class.
class Person4
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private
  attr_reader :last_name
end

person1 = Person4.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

# Using the following code, add the appropriate accessor methods.
# Keep in mind that @age should only be visible to instances of Person.
class Person5
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected
    attr_reader :age
end

person1 = Person5.new
person1.age = 17

person2 = Person5.new
person2.age = 26

puts person1.older_than?(person2)

# Using the following code, add the appropriate accessor methods so that
# @name is capitalized upon assignment.
class Person6
  attr_reader :name
  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person6.new
person1.name = 'eLiZaBeTh'
puts person1.name


# Using the following code, add the appropriate accessor methods so that
# @name is returned with the added prefix 'Mr.'.
class Person7
  attr_writer :name
  def name
    "Mr. " + @name
  end
end

person1 = Person7.new
person1.name = 'James'
puts person1.name

# The following code is flawed. It currently allows @name to be modified from
# outside the method via a destructive method call. Fix the code so that it
# returns a copy of @name instead of a reference to it.
class Person8

  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person8.new('James')
person1.name.reverse!
puts person1.name

# Using the following code, multiply @age by 2 upon assignment, then multiply
# @age by 2 again when @age is returned by the getter method.
class Person9
  def age=(age)
    @age = age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person9.new
person1.age = 20
puts person1.age

# Modify the following code to accept a string containing a first and last name.
# The name should be split into two instance variables in the setter method, then
# joined in the getter method to form a full name.
class Person10
  attr_accessor :name

  def name=(name)
    @first,@last = name.split(" ")
  end

  def name
    "#{@first} #{@last}"
  end
end

person1 = Person10.new
person1.name = 'John Doe'
puts person1.name
