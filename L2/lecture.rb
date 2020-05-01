# Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_name(name)
  end

  private

  def parse_name(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name

bob.name = "John Adams"
p bob.first_name
p bob.last_name
p bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
