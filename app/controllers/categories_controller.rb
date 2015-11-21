class CategoriesController < ApplicationController
	before_action :logged_in_user
	
	def index
		@categories = Category.all
		if params[:user_id]
			user_id = params[:user_id]
		end

		category_list = []
		@categories.each do |category|
           category_data = {
           		category_id: category.id,
           		name: category.name,
           		description: category.description,
           		learned: Word.learned(user_id, category.id).count,
           		total: Word.where(category_id: category.id).count
           }
           category_list << category_data
		end
		
		@data = category_list

		respond_to do |format|
			format.html {}
			format.json {render json: {error: :false, categories: category_list}, status: :ok}
		end
	end


  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
