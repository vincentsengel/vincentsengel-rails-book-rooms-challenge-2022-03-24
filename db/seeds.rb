require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel_name = []

7.times do
  hotel_name << "#{Faker::Creature::Animal.name.capitalize} Hotel"
end

hotel_name.uniq.each do |hotel|
  Hotel.new(address: Faker::Address::full_address, name: hotel).save
  puts "#{Hotel.last.name} created"
end

18.times do
  Room.new(price_per_night: (rand(399..1899) * 10), capacity: rand(2..8), hotel_id: Hotel.all.sample().id).save
  puts "new room created in #{Room.last.hotel.name}"
end
