require './lib/car'

class Dealership
  attr_reader :name, :address, :inventory, :inventory_count

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
    @inventory_count = 0
  end

  def add_car(car)
    @inventory << car
    @inventory_count += 1
  end

  def has_inventory?
    @inventory_count > 0 ? true : false
  end

  def cars_by_make(make)
    cars_by_make = []
    @inventory.each do |car|
      cars_by_make << car if car.make == make
    end
    cars_by_make
  end
end