class CategoriesController < ApplicationController


	def index
		@categories = Category.order("name ASC")

	end


  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
