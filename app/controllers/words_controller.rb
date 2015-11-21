class WordsController < ApplicationController
	# before_action :logged_in_user

	def index
		# phan trang 
		# @words = Word.limit(10).offset(params[:page].to_i*10)

		# filter bang category_name
		if params[:category_name].present?
	  		category_id = Category.find_by(name: params[:category_name]).try(:id)
	  		@words = Word.where(category_id: category_id)
		end

		# filter bang status: learned, not learn

		# if params[:status] == 'learned'
		# 	@words = Word.learned(current_user.id, category_id)

		# kiem tra neu la nguoi dung gui request len thi can co id
		if params[:user_id].present?
			lesson_ids = Lesson.where(user_id: params[:user_id]).pluck(:id)
		else
			lesson_ids = Lesson.where(user_id: current_user.id).pluck(:id)
		end

		word_ids  = LessonWord.where(lesson_id: lesson_ids).pluck(:word_id)

		

		if params[:status] == 'not_learn'
		  @words = @words.where.not(id: word_ids)
		elsif params[:status] == 'learned'
		  @words = @words.where(id: word_ids)
		end

		@words = Word.paginate(page: params[:page], per_page: 10)

		

		

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
