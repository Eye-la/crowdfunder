# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password") }

Category.create(name: "Art")
Category.create(name: "Comics")
Category.create(name: "Crafts")
Category.create(name: "Dance")
Category.create(name: "Design")
Category.create(name: "Fashion")
Category.create(name: "Film & Video")
Category.create(name: "Food")
Category.create(name: "Games")
Category.create(name: "Journalism")
Category.create(name: "Music")
Category.create(name: "Photography")
Category.create(name: "Publishing")
Category.create(name: "Technology")
Category.create(name: "Theatre")

50.times do
  project = Project.create(name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, funding_goal: rand(1000..10000000), start_date: Faker::Date.backward(14), end_date: Faker::Date.forward(30), category_id: rand(0..14), user_id: rand(0..19))
  rand(0..5).times { project.tag_list.add(Faker::Lorem.word) }
  rand(1..5).times { Reward.create(title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, amount: rand(1..10000), backer_limit: rand(1..1000), project_id: rand(0..49) ) }
  project.save
end


500.times { Pledge.create(project_id: rand(0..49), user_id: rand(0..19), reward_id: rand(0..99)) }