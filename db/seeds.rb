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
Feedback.destroy_all
Bid.destroy_all

phil = User.create(username: "Phil", password: 'p')
kyle = User.create(username: "Kyle", password: 'k')
artem = User.create(username: "Artem", password: 'a')

a = Car.create(make: "Toyota", model: "Camry", color: "Gold", year: 2002, mileage: 5000, user_id: kyle.id)
b = Car.create(make: "Ford", model: "F-150", color: "Blue", year: 2012, mileage: 105000, user_id: phil.id)
c = Car.create(make: "Chevrolet", model: "Beretta", color: "Red", year: 1994, mileage: 200000, user_id: phil.id)
d = Car.create(make: "Volkswagon", model: "Microbus", color: "Teal/Green", year: 1966, mileage: 220000, user_id: kyle.id)
e = Car.create(make: "Jeep", model: "Cherokee", color: "Blue", year: 1990, mileage: 160000, user_id: phil.id)
f = Car.create(make: "Chevrolet", model: "Celebrity", color: "Tan", year: 1991, mileage: 43000, user_id: kyle.id)


list1 = Auction.create(title: "Barely used Camry for sale!!!", description: "legit, only 5k miles", starting_bid: 14000, seller_id: kyle.id, car_id: a.id)
list2 = Auction.create(title: "Buy a truck", description: "Good work truck", starting_bid: 8000, seller_id: phil.id, car_id: b.id)
list3 = Auction.create(title: "Chevy Beretta for sale! (transmission not included)", description: "Great car as long as you want to go downhill.", starting_bid: 2500, seller_id: phil.id, car_id: c.id)
list4 = Auction.create(title: "Super chill Celebrity", description: "Salvage title. Car was in a tornado, but it was only minor damage. Runs great, but may need to tow it home because of the battery. Low miles.", starting_bid: 3500, seller_id: kyle.id, car_id: e.id)
list5 = Auction.create(title: "Jeep for sale, all axels are definitely in tact.", description: "Don't mind the duct tape, it's purely for decoration.", starting_bid: 5000, seller_id: kyle.id, car_id: e.id)

Bid.create(amount: 5500, auction_id: list5.id, buyer_id: phil.id)

list5.active = false
list5.save

fb1 = Feedback.create(rating: 1, content: "This guy sold me a Jeep with a broken axel!!", reviewer_id: phil.id, feedback_id: kyle.id, active_reviewer_id: phil.id, auction_id: list5.id)
fb2 = Feedback.create(rating: 2, content: "He paid in monopoly money, so not great, but it did let me put hotels on light blue", reviewer_id: kyle.id, feedback_id: phil.id, active_reviewer_id: kyle.id, auction_id: list5.id)
