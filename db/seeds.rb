

User.create(email: "quanit94@gmail.com", name: "Quan Tran", password: "quanbn94")

Category.create(name: "people", description: "this is demo")
Category.create(name: "pictures", description: "this is demo")
Category.create(name: "foods", description: "this is demo")
Category.create(name: "education", description: "this is demo")
Category.create(name: "sports", description: "this is demo")
Category.create(name: "students", description: "this is demo")
Category.create(name: "love", description: "this is demo")

# add word list
for i in 0..30

	word = Word.create(content: "people#{i+1}", category_id: 1)

	for j in 0..2
		word.word_answers.create content: "people#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "people#{i+1}_#{3}", correct: true

end

for i in 0..30
	word = Word.create(content: "pictures#{i+1}", category_id: 2)

	for j in 0..2
		word.word_answers.create content: "pictures#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "pictures#{i+1}_#{3}", correct: true
end

for i in 0..30
	word = Word.create(content: "foods#{i+1}", category_id: 3)

	for j in 0..2
		word.word_answers.create content: "foods#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "foods#{i+1}_#{3}", correct: true
end

for i in 0..30
	word = Word.create(content: "education#{i+1}", category_id: 4)

	for j in 0..2
		word.word_answers.create content: "education#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "education#{i+1}_#{3}", correct: true
end

for i in 0..30
	word = Word.create(content: "sports#{i+1}", category_id: 5)

	for j in 0..2
		word.word_answers.create content: "sports#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "sports#{i+1}_#{3}", correct: true
end

for i in 0..30
	word = Word.create(content: "students#{i+1}", category_id: 6)

	for j in 0..2
		word.word_answers.create content: "students#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "students#{i+1}_#{3}", correct: true
end

for i in 0..30
	word = Word.create(content: "love#{i+1}", category_id: 7)

	for j in 0..2
		word.word_answers.create content: "love#{i+1}_#{j}", correct: false
	end

	word.word_answers.create content: "love#{i+1}_#{3}", correct: true
end


