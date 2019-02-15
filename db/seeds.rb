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
matthew = User.create(username: "Matthew", password: 'b')
ben = User.create(username: "Ben", password: 'b')
ross = User.create(username: "Ross", password: 'r')

a = Car.create(make: "Toyota", model: "Camry", color: "Gold", year: 2002, mileage: 5000, user_id: kyle.id)
b = Car.create(make: "Ford", model: "F-150", color: "Blue", year: 2012, mileage: 105000, user_id: phil.id)
c = Car.create(make: "Chevrolet", model: "Beretta", color: "Red", year: 1994, mileage: 200000, user_id: phil.id)
d = Car.create(make: "Volkswagon", model: "Microbus", color: "Teal/Green", year: 1966, mileage: 220000, user_id: kyle.id)
e = Car.create(make: "Jeep", model: "Cherokee", color: "Blue", year: 1990, mileage: 160000, user_id: phil.id)
f = Car.create(make: "Chevrolet", model: "Celebrity", color: "Tan", year: 1991, mileage: 43000, user_id: kyle.id)
g = Car.create(make: "UAZ", model: "452", color: "Green", year: 1972, mileage: 120000, user_id: artem.id)
h = Car.create(make: "VAZ", model: "2101", color: "Pink", year: 1977, mileage: 85200, user_id: artem.id)
i = Car.create(make: "Ferrari", model: "575M Maranello", color: "Yellow", year: 2005, mileage: 30000, user_id: matthew.id)
j = Car.create(make: "Ford", model: "Pinto", color: "Yellow", year: 1975, mileage: 165000, user_id: ben.id)
k = Car.create(make: "Mercedes", model: "SL550", color: "Silver", year: 2008, mileage: 80000, user_id: ross.id)
l = Car.create(make: "Porsche", model: "911", color: "Red", year: 2006, mileage: 90000, user_id: matthew.id)
m = Car.create(make: "Lambourghini", model: "Murcielago", color: "Black", year: 2010, mileage: 30000, user_id: matthew.id)


list1 = Auction.create(title: "Barely used Camry for sale!!!", description: "legit, only 5k miles", starting_bid: 14000, seller_id: kyle.id, car_id: a.id)
list2 = Auction.create(title: "Buy a truck", description: "Good work truck", starting_bid: 8000, seller_id: phil.id, car_id: b.id)
list3 = Auction.create(title: "Chevy Beretta for sale! (transmission not included)", description: "Great car as long as you want to go downhill.", starting_bid: 2500, seller_id: phil.id, car_id: c.id)
list4 = Auction.create(title: "Super chill Celebrity", description: "Salvage title. Car was in a tornado, but it was only minor damage. Runs great, but may need to tow it home because of the battery. Low miles.", starting_bid: 3500, seller_id: kyle.id, car_id: f.id)
list5 = Auction.create(title: "Jeep for sale, all axels are definitely in tact.", description: "Don't mind the duct tape, it's purely for decoration.", starting_bid: 5000, seller_id: kyle.id, car_id: e.id)
list6 = Auction.create(title: "You won't believe what a great van this is!", description: "Look cool driving around or drive right through rivers with this marvel of engineering! (results from driving it into water not guaranteed.)", starting_bid: 55000, seller_id: artem.id, car_id: g.id)
list7 = Auction.create(title: "Car salesmen hate me! Rare foreign car for sale!", description: "Amazing do it all sedan, you can't find cars like this in America normally! (most doors and seats included)", starting_bid: 40000, seller_id: artem.id, car_id: h.id)
list8 = Auction.create(title: "Ferrari for sale! (kinda)", description: "I'm selling the Ferrari I've owned for a very long time... but only the wheels. Seriously, it's definitely mine, I didn't just steal the tires to sell them.", starting_bid: 20000, seller_id: matthew.id, car_id: i.id)
list9 = Auction.create(title: "Classic car for sale.", description: "Pristine condition Pinto. Canary yellow paintjob with hydraulics and 28 inch rims. Perfect car, just don't get rear-ended.", starting_bid: 10000, seller_id: ben.id, car_id: j.id)
list10 = Auction.create(title: "Buy a not-stolen Lamby!", description: "Good condition, low miles, totally legal. The car title is at the cleaners and will be included soon.", starting_bid: 40000, seller_id: matthew.id, car_id: m.id)
list11 = Auction.create(title: "Get a Porsche!", description: "Totally legal car!", starting_bid: 50000, seller_id: matthew.id, car_id: l.id)


Bid.create(amount: 5500, auction_id: list5.id, buyer_id: phil.id)
Bid.create(amount: 42000, auction_id: list11.id, buyer_id: ben.id)
Bid.create(amount: 51000, auction_id: list10.id, buyer_id: kyle.id)

list5.active = false
list10.active = false
list11.active = false
list5.save
list10.save
list11.save


fb1 = Feedback.create(rating: 1, content: "This guy sold me a Jeep with a broken axel!!", reviewer_id: phil.id, feedback_id: kyle.id, active_reviewer_id: phil.id, auction_id: list5.id)
fb2 = Feedback.create(rating: 2, content: "He paid in monopoly money, so not great, but it did let me put hotels on light blue", reviewer_id: kyle.id, feedback_id: phil.id, active_reviewer_id: kyle.id, auction_id: list5.id)
fb3 = Feedback.create(rating: 1, content: "This was actually a Honda Civic with a carboard cutout of a Porsche on top of it. ", reviewer_id: ben.id, feedback_id: matthew.id, active_reviewer_id: ben.id, auction_id: list10.id)
fb4 = Feedback.create(rating: 1, content: "I got arrested for driving this stolen car. Not worth the jail time, man.", reviewer_id: kyle.id, feedback_id: matthew.id, active_reviewer_id: kyle.id, auction_id: list11.id)
