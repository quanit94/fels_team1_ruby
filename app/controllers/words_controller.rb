class WordsController < ApplicationController
	def index
		if params['category_id']
			@words = Word.where(category_id: params['category_id'] )
		else
			@words = Word.order('content ASC')
		end
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
		  format.json {render json: {error: :fasle, word_list: word_list}, status: :ok}
		end
	end
end
