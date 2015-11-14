


User.create!(name:  "Mai Van Hien",
             email: "hienmv94@gmail.com",
             password:              "mrhien1994",
             password_confirmation: "mrhien1994",
             admin: true)
50.times do |n|
  name  = Faker::Name.name
  email = "test.aaaaa-#{n+1}@gmail.com"
  password = "abc123"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
end

5.times do |n|
  name  = Faker::Name.name
  image = Faker::Name.name
  Category.create!(name: name, image: image)
end

users = User.order(:created_at).take(6)
10.times do
  category_id = rand(1..5)
  users.each { |user| user.lessons.create!(category_id: category_id) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# This file should contain all the record creation needed to seed the database with its default values.

category_list = [
	"people",
	"pictures",
	"foods",
	"education",
	"sports",
	"students",
	"love"
]

category_list.each do |cateogory|
	Category.create(name: cateogory)
end

w
>>>>>>> update API login, signup

