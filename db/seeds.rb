# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


sam = User.create(username: "se", password: "123", first_name: "Sam", last_name: "Turac", email_address: "se@gmail.com", phone_number: "1234567890")

laura = User.create(username: "lo", password: "123", first_name: "Laura", last_name: "Kim", email_address: "lo@gmail.com", phone_number: "1234567890")

jeff = User.create(username: "je", password: "123", first_name: "Jeff", last_name: "Hwang", email_address: "je@gmail.com", phone_number: "1234567890")

p1 = Package.create(sender_id: sam.id, receiver_id: laura.id, weight: 5, height: 6, length: 10, description: "a letter")

p2 = Package.create(sender_id: laura.id, receiver_id: jeff.id, weight: 10, height: 10, length: 10, description: "a box")
