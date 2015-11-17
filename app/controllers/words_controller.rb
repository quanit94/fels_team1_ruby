class WordsController < ApplicationController
	def index
		@word = Word.order("content ASC")
	end

	def show
		
		@category = Category.order("name ASC")
	end

end
