class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

module DriveAble
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end


class Auto < Vehicle
  attr_reader :tires

  include DriveAble

  def initialize
    @tires = [30,30,32,32]
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  attr_reader :tires

  include DriveAble

  def initialize
    @tires = [20,20]
    super(80, 8.0)
  end
end




class Catamaran <Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
  end
end

car = Auto.new
cycle = Motorcycle.new
p car.tires
p cycle.tires
p car.range
p cycle.range
p car.tire_pressure(2)
p cycle.tire_pressure(1)
