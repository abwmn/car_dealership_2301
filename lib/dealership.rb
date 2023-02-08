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

  def total_value
    total = 0
    @inventory.each {|car| total += car.total_cost}
    total
  end

  def details
    Hash["total_value", total_value, "address", @address]
  end

  def average_price_of_car
    (total_value / @inventory_count).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def cars_sorted_by_price
    @inventory.sort_by {|car| car.total_cost}
  end

  # def inventory_hash
  # end
end