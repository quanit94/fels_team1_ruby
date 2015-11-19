class CategoriesController < ApplicationController


	def index
		@category = Category.order("name ASC")

	end

end
