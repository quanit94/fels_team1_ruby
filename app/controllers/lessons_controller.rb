class LessonsController < ApplicationController
  def create
    @lesson = current_user.lessons.new
    @lesson.category_id = params[:category_id]
    #binding.pry

    if @lesson.save
      redirect_to [:edit, @lesson]
    else
      redirect_to :back
    end
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
