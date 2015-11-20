class LessonsController < ApplicationController
  def create
    # create lesson cua web
    @lesson = current_user.lessons.new
    @lesson.category_id = params[:category_id]
    #binding.pry


    # tra ve web
    if @lesson.save
      redirect_to [:edit, @lesson]
    else
      redirect_to :back
    end

    # # create lesson cua mobile
    # if params[:user_id]
    #   user = User.find(params[:user_id])
    #   @lesson_mobile = user.lessons.new
    #   @lesson_mobile.category_id = params[:category_id]
    # end

    # if @lesson_mobile.save
    #     # prepare data respond to user
    #     list_word_lesson = []
    # else

    # end

   

  end

  def edit
    @lesson = Lesson.find params[:id]
    
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson.update_attributes lesson_params
    redirect_to @lesson
  end

  private
  def lesson_params
    params.require(:lesson).permit :id, lesson_words_attributes: [:id, :word_answer_id]
  end
end
