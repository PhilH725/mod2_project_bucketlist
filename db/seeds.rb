# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Car.destroy_all
Listing.destroy_all

phil = User.create(username: "Phil", password: 'p')
kyle = User.create(username: "Kyle", password: 'k')

list1 = Listing.create(title: "Barely used Camry for sale!!!", description: "legit, only 5k miles", price: 14000, user_id: kyle.id)
list2 = Listing.create(title: "Buy a truck", description: "Good work truck", price: 8000, user_id: phil.id)


a = Car.create(make: "Toyota", model: "Camry", color: "Gold", year: 2002, mileage: 5000, listing_id: list1.id)
b = Car.create(make: "Ford", model: "F-150", color: "Blue", year: 2012, mileage: 105000, listing_id: list2.id)
