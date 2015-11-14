class CategoryController < ApplicationController

	def show
		@category = Category.order("name ASC")
	end

end
