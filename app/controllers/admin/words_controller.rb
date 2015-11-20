class Admin::WordsController < ApplicationController
  before_action :admin_user
  before_action :logged_in_user
  before_action :load_word, only: [:edit, :destroy, :update]

  def new
    @word = Word.new
    4.times do
      answer = @word.word_answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = I18n.t "word_success"
      redirect_to admin_words_path
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = I18n.t "word_updated"
      redirect_to admin_words_url
    else
      render "edit"
    end
  end

  def index
    @words = Word.all
  end
  def show
    @word = Word.find params[:id] 
  end

  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to admin_words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  def load_word
    @word = Word.find params[:id]
  end

  def word_params
    params.require(:word).permit :content, :category_id, word_answers_attributes: [:id, :correct, :content]
  end
end
