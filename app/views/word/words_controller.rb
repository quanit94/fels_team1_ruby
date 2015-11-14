class WordsController < ApplicationController

	def show
		@category = Category.order(" ASC")
	end

end
