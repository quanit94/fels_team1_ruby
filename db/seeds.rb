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
	Word.create(content: "people#{i+1}", category_id: 1)
end

for i in 0..9
	Word.create(content: "pictures#{i+1}", category_id: 2)
end

for i in 0..9
	Word.create(content: "foods#{i+1}", category_id: 3)
end

for i in 0..9
	Word.create(content: "education#{i+1}", category_id: 4)
end

for i in 0..9
	Word.create(content: "sports#{i+1}", category_id: 5)
end

for i in 0..9
	Word.create(content: "students#{i+1}", category_id: 6)
end

for i in 0..9
	Word.create(content: "love#{i+1}", category_id: 7)
end