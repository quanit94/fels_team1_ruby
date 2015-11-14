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

