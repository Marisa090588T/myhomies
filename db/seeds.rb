require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Wiping data"
User.destroy_all
Home.destroy_all
puts "Creating Home test home with test homie inside :)"

Home.create!(
    name: Faker::BossaNova.song,
    address: Faker::Address.street_address,
    id: 1
)

User.create!(
    first_name: Faker::Artist.name,
    last_name: Faker::Creature::Animal.name,
    username: Faker::Games::Pokemon.name,
    email: "first_user@user.com",
    password: "123456",
    home_id: 1
)
User.create!(
    first_name: Faker::Artist.name,
    last_name: Faker::Creature::Animal.name,
    username: Faker::Games::Pokemon.name,
    email: "second_user@user.com",
    password: "123456",
    home_id: 1
)
User.create!(
    first_name: Faker::Artist.name,
    last_name: Faker::Creature::Animal.name,
    username: Faker::Games::Pokemon.name,
    email: "homeless_user@user.com",
    password: "123456"
)
User.create!(
    first_name: Faker::Artist.name,
    last_name: Faker::Creature::Animal.name,
    username: Faker::Games::Pokemon.name,
    email: "home_create@user.com",
    password: "123456"
)


# 2.times do
#   Home.create!(
#     name: Faker::BossaNova.song,
#     address: Faker::Address.street_address
#   )
# end
puts "Created #{Home.count} home(s)"

# 5.times do
#   User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: Faker::Internet.email,
#     password: 123456,
#     home_id: 1
#   )
# end
# 5.times do
#   User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: Faker::Internet.email,
#     password: 123456,
#     home_id: 2
#   )
# end
puts "Created #{User.count} user(s)"
