class CategoriesController < ApplicationController
	# before_action :logged_in_user
	
	def index

		@categories = Category.all

		category_list = []
		@categories.each do |category|
           category_data = {
           		category_id: category.id,
           		name: category.name
           }
           category_list << category_data
		end


		respond_to do |format|
			format.html {render :index}
			format.json {render json: {error: :false, categories: category_list}, status: :ok}
		end
	end


  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
