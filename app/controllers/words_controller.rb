class WordsController < ApplicationController

	# before_action :logged_in_user


	def index

		# theo giao dien web: neu id truyen len rong -> filter all
		@words = Word.all
		if !params[:category_id].blank?  
			@words = Word.where(category_id: params[:category_id])

		# theo android dung api: truyen theo name, neu co name truyen len, filter -> name
		elsif params[:category_name]
			if params[:category_name] == 'all'
				@words = Word.all
			else
				category_id = Category.find_by(name: params[:category_name]).try(:id)
				@words = Word.where(category_id: category_id)
			end
		end

		# chuan bi du lieu de tra ve du lieu format: json
		word_list = []
		@words.each do |word|
           word_data = {
           	 content: word.content,
           	 true_answer: word.word_answers.find_by(correct: true).try(:content)
           }
           word_list << word_data
		end

		respond_to do |format|
		  format.html {render :index}
		  format.js {render "words/content"}
		  format.json {render json: {error: :false, word_list: word_list}, status: :ok}
		end
	end


	def show
		@category = Category.order("name ASC")
	end


	def words_params
		params.require(:word).permit(:category_id, :status)
	end

end
