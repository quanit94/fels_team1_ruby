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
	Category.create(name: cateogory, description: "this is demo")
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


