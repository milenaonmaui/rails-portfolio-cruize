# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cruise_list = [
    [ "Classic Whalewatch", "Whalewatch", 85, 45, 70, 5],
    [ "Discount Whalewatch", "Whalewatch", 85, 30, 50, 5],
    [ "Whalewatch Sail", "Whalewatch", 30, 59, 99, 12],
    [ "Morning Snorkel", "Snorkel", 80, 60, 120, 5],
    [ "PM Snorkel", "Snorkel", 80, 40, 80, 5],
    [ "Wild Side Snorkel", "Snorkel", 40, 80, 140, 12],
    [ "Sunset Dinner Cruise", "Dinner Cruises", 40, nil, 92, 13],
    [ "Sunset Dinner Deluxe", "Dinner Cruises", 30, nil, 140, 13],
    [ "Dolphin Watch Half Day", "Dolphin Watch", 85, 45, 75, 5],
    [ "Dolphin Watch Full Day", "Dolphin Watch", 70, 60, 120, 5]
  ]
  
  cruise_list.each do |name, category, capacity, price_child, price_adult, min_age|
    Cruise.create( name: name, category: category, capacity: capacity, price_child: price_child, price_adult: price_adult, min_age: min_age)
  end