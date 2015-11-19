


# User.create!(name:  "Mai Van Hien",
#              email: "hienmv94@gmail.com",
#              password:              "mrhien1994",
#              password_confirmation: "mrhien1994",
#              admin: true)
# 50.times do |n|
#   name  = Faker::Name.name
#   email = "test.aaaaa-#{n+1}@gmail.com"
#   password = "abc123"
#   User.create!(name: name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end

# 5.times do |n|
#   name  = Faker::Name.name
#   image = Faker::Name.name
#   Category.create!(name: name, image: image)
# end

# users = User.order(:created_at).take(6)
# 10.times do
#   category_id = rand(1..5)
#   users.each { |user| user.lessons.create!(category_id: category_id) }
# end

# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }


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


# add word list
for i in 0..9
	word = Word.create(content: "people#{i+1}", category_id: 1)

	for j in 0..2
		word.word_answers.create content: "people#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "people#{i}_#{3}", correct: true

end

for i in 0..9
	word = Word.create(content: "pictures#{i+1}", category_id: 2)

	for j in 0..2
		word.word_answers.create content: "pictures#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "pictures#{i}_#{3}", correct: true
end

for i in 0..9
	word = Word.create(content: "foods#{i+1}", category_id: 3)

	for j in 0..2
		word.word_answers.create content: "foods#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "foods#{i}_#{3}", correct: true
end

for i in 0..9
	word = Word.create(content: "education#{i+1}", category_id: 4)

	for j in 0..2
		word.word_answers.create content: "education#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "education#{i}_#{3}", correct: true
end

for i in 0..9
	word = Word.create(content: "sports#{i+1}", category_id: 5)

	for j in 0..2
		word.word_answers.create content: "sports#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "sports#{i}_#{3}", correct: true
end

for i in 0..9
	word = Word.create(content: "students#{i+1}", category_id: 6)

	for j in 0..2
		word.word_answers.create content: "students#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "students#{i}_#{3}", correct: true
end

for i in 0..9
	word = Word.create(content: "love#{i+1}", category_id: 7)

	for j in 0..2
		word.word_answers.create content: "love#{i}_#{j}", correct: false
	end

	word.word_answers.create content: "love#{i}_#{3}", correct: true
end

