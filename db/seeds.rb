# require 'faker'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# puts "Wiping data"
# User.destroy_all
# Home.destroy_all
# puts "Creating Home test home with test homie inside :)"

# Home.create!(
#     name: Faker::BossaNova.song,
#     address: Faker::Address.street_address,
#     id: 1
# )

# User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: "first_user@user.com",
#     password: "123456",
#     home_id: 1
# )
# User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: "second_user@user.com",
#     password: "123456",
#     home_id: 1
# )
# User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: "homeless_user@user.com",
#     password: "123456"
# )
# User.create!(
#     first_name: Faker::Artist.name,
#     last_name: Faker::Creature::Animal.name,
#     username: Faker::Games::Pokemon.name,
#     email: "home_create@user.com",
#     password: "123456"
# )


# # 2.times do
# #   Home.create!(
# #     name: Faker::BossaNova.song,
# #     address: Faker::Address.street_address
# #   )
# # end
# puts "Created #{Home.count} home(s)"

# # 5.times do
# #   User.create!(
# #     first_name: Faker::Artist.name,
# #     last_name: Faker::Creature::Animal.name,
# #     username: Faker::Games::Pokemon.name,
# #     email: Faker::Internet.email,
# #     password: 123456,
# #     home_id: 1
# #   )
# # end
# # 5.times do
# #   User.create!(
# #     first_name: Faker::Artist.name,
# #     last_name: Faker::Creature::Animal.name,
# #     username: Faker::Games::Pokemon.name,
# #     email: Faker::Internet.email,
# #     password: 123456,
# #     home_id: 2
# #   )
# # end
# puts "Created #{User.count} user(s)"


# added by tiff #

puts "Wiping data"

Message.destroy_all
Chatroom.destroy_all

puts "All messages and chatrooms destroyed!"

Chore.destroy_all
ExpenseShare.destroy_all
Expense.destroy_all

puts "All chores & expenses destroyed!"

User.destroy_all
Home.destroy_all

puts "All homes & users destroyed!"

User.create!(
  first_name: "Tiffany",
  last_name: "Duong",
  username: "tiff-o",
  email: "first@user.com",
  password: "password123"
)

puts "Created first user #{User.first.username}!"

Home.create!(
  name: "Casa de Boobatch",
  address: "452 Le Wagon Court, Richmond VIC 3121"
)

puts "First home created!"

User.first.update(
  first_name: "Tiffany",
  last_name: "Duong",
  username: "tiff-o",
  email: "first@user.com",
  password: "password123",
  home: Home.first
)

puts "Added #{User.first.username} to #{Home.first.name}!"

Chatroom.create!(
  home: Home.first,
  name: Home.first.name
)

puts "Created chatroom for #{Home.first.name}!"

User.create!(
  first_name: "Serge",
  last_name: "Osipov",
  username: "gaitcollector",
  email: "homie1@homie.com",
  password: "password123",
  home: Home.first
)

User.create!(
  first_name: "Marisa",
  last_name: "Tsubokura",
  username: "Marisa090588T",
  email: "homie2@homie.com",
  password: "password123",
  home: Home.first
)

User.create!(
  first_name: "Lodi",
  last_name: "Palle",
  username: "lodipalle",
  email: "homie3@homie.com",
  password: "password123",
  home: Home.first
)

puts "Created homies - #{User.second.username}, #{User.third.username}, #{User.fourth.username}! Added to #{Home.first.name}!"

Message.create!(
  content: "Morning homies! Reminder that rent is coming out on Tuesday :)",
  chatroom: Chatroom.first,
  user: User.first,
  created_at: "Thu, 24 Sep 2020 08:28:05 UTC +00:00"
)

puts "First message in #{Chatroom.first.name}!"

Message.create!(
  content: "All good - just transferred. Grabbing some TP at the shops soon FYI.",
  chatroom: Chatroom.first,
  user: User.second,
  created_at: "Thu, 24 Sep 2020 14:16:01 UTC +00:00"
)

puts "Second message in #{Chatroom.first.name}!"

Message.create!(
  content: "Cool, I'll transfer for rent tomorrow!",
  chatroom: Chatroom.first,
  user: User.third,
  created_at: "Thu, 24 Sep 2020 15:33:12 UTC +00:00"
)

puts "Third message in #{Chatroom.first.name}!"

Message.create!(
  content: "Anyone know where the remote went?",
  chatroom: Chatroom.first,
  user: User.fourth,
  created_at: "Fri, 25 Sep 2020 11:14:04 UTC +00:00"
)

puts "Fourth message in #{Chatroom.first.name}!"

Chore.create!(
  name: "Dishes",
  completed: false,
  description: "Put all dishes in the dishwasher & turn on please",
  assignee: User.first,
  home: Home.first
)

puts "First chore created for #{User.first.username} in #{Home.first.name}!"

Chore.create!(
  name: "Bins",
  completed: false,
  description: "Bin night on Friday!",
  assignee: User.second,
  home: Home.first
)

puts "First chore created for #{User.second.username} in #{Home.first.name}!"

Chore.create!(
  name: "Mop floors",
  completed: false,
  description: "Kitchen mainly",
  assignee: User.third,
  home: Home.first
)

puts "First chore created for #{User.third.username} in #{Home.first.name}!"

Chore.create!(
  name: "Laundry",
  completed: false,
  description: "Please wash towels!",
  assignee: User.fourth,
  home: Home.first
)

puts "First chore created for #{User.fourth.username} in #{Home.first.name}!"

Expense.create!(
  name: "Rent",
  amount: 1200,
  due_on: "29/09/2020",
  description: "Monthly direct debit",
  paid: false,
  user: User.first,
  home: Home.first
)

puts "First household expense created for #{Home.first.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.first,
  user: Home.first.users.first,
  share_amount: Expense.first.amount / Home.first.users.count
)

puts "First expense share created for #{User.first.username} to pay #{Expense.first.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.first,
  user: Home.first.users.second,
  share_amount: Expense.first.amount / Home.first.users.count
)

puts "Second expense share created for #{User.second.username} to pay #{Expense.first.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.first,
  user: Home.first.users.third,
  share_amount: Expense.first.amount / Home.first.users.count
)

puts "Third expense share created for #{User.third.username} to pay #{Expense.first.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.first,
  user: Home.first.users.fourth,
  share_amount: Expense.first.amount / Home.first.users.count
)

puts "Fourth expense share created for #{User.third.username} to pay #{Expense.first.name}!"

Expense.create!(
  name: "Internet",
  amount: 90,
  due_on: "01/10/2020",
  description: "Monthly direct debit",
  paid: false,
  user: User.first,
  home: Home.first
)

puts "Second household expense created for #{Home.first.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.second,
  user: Home.first.users.first,
  share_amount: Expense.second.amount / Home.first.users.count
)

puts "First expense share created for #{User.first.username} to pay #{Expense.second.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.second,
  user: Home.first.users.second,
  share_amount: Expense.second.amount / Home.first.users.count
)

puts "Second expense share created for #{User.second.username} to pay #{Expense.second.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.second,
  user: Home.first.users.third,
  share_amount: Expense.second.amount / Home.first.users.count
)

puts "Third expense share created for #{User.third.username} to pay #{Expense.second.name}!"

ExpenseShare.create!(
  paid: false,
  expense: Expense.second,
  user: Home.first.users.fourth,
  share_amount: Expense.second.amount / Home.first.users.count
)

puts "Fourth expense share created for #{User.third.username} to pay #{Expense.second.name}!"
