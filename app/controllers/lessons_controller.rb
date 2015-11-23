class LessonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    
    # create lesson cua mobile
    if params[:user_id]
      user = User.find(params[:user_id])
      @lesson_mobile = user.lessons.new
      @lesson_mobile.category_id = params[:category_id]
      if @lesson_mobile.save
          # prepare data respond to user
          list_word_lesson = []
          @lesson_mobile.lesson_words.each do |lesson_word|
            # tao list answer cho moi cau hoi
            list_answer = []
            @list_answers = WordAnswer.where(word_id: lesson_word.word_id)
            @list_answers.each do |l_a|
                answer_data = {
                  content_answer: l_a.content,
                  correct: l_a.correct
                }
                list_answer << answer_data
            end
            # tao cau tra loi
            word_question = Word.where(id: lesson_word.word_id)
            lesson_data = {
              word_question: {content: word_question.first.content},
              list_answer: list_answer
            }
            list_word_lesson << lesson_data
          end

          respond_to do |format|
            format.html {}
            format.json {render json:{error: :false, lesson: list_word_lesson}, status: :ok}
          end
      else
          respond_to do |format|
            format.html {}
            format.json {render json:{error: :true, message: "Data empty"}, status: 401}
          end
      end
    end

    # create lesson cua web
    if logged_in?
        @lesson = current_user.lessons.new
        @lesson.category_id = params[:category_id]
      
      # tra ve web
      if @lesson.save
        redirect_to [:edit, @lesson]
      else
        redirect_to :back
      end
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
