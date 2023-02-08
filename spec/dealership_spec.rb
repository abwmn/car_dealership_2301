require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  it 'exists' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership).to be_a(Dealership)
  end

  it 'has an inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership.inventory).to eq([])
  end

  it 'can add to its inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    dealership.add_car(car_1)
    dealership.add_car(car_2)

    expect(dealership.inventory).to eq([car_1, car_2])
  end

  it 'can count its inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership.inventory_count).to eq(0)

    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    dealership.add_car(car_1)
    dealership.add_car(car_2)

    expect(dealership.inventory_count).to eq(2)
  end

  it 'can check if it has inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership.has_inventory?).to eq(false)

    car_1 = Car.new("Ford Mustang", 1500, 36)
    dealership.add_car(car_1)

    expect(dealership.has_inventory?).to eq(true)
  end

  it 'can list cars by make' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    
    expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
  end
end