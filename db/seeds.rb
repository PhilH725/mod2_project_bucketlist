# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Car.destroy_all
Auction.destroy_all

phil = User.create(username: "Phil", password: 'p')
kyle = User.create(username: "Kyle", password: 'k')

a = Car.create(make: "Toyota", model: "Camry", color: "Gold", year: 2002, mileage: 5000, user_id: kyle.id)
b = Car.create(make: "Ford", model: "F-150", color: "Blue", year: 2012, mileage: 105000, user_id: phil.id)
c = Car.create(make: "Chevrolet", model: "Beretta", color: "Red", year: 1994, mileage: 200000, user_id: phil.id)

list1 = Auction.create(title: "Barely used Camry for sale!!!", description: "legit, only 5k miles", starting_bid: 14000, seller_id: kyle.id, car_id: a.id)
list2 = Auction.create(title: "Buy a truck", description: "Good work truck", starting_bid: 8000, seller_id: phil.id, car_id: b.id)
