class LessonsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :logged_in_user

  def new
    # create lesson cua mobile
    if params[:user_id]
      user = User.find(params[:user_id])
      @lesson_mobile = user.lessons.new
    else
      @lesson_mobile = current_user.lessons.new
      
    end

      
      @category_name = Category.find(params[:category_id])
      @lesson_mobile.category_id = params[:category_id]
#  tao lesson sample cho user
          # prepare data respond to user
          @list_word_lesson = []
         
          @lesson_mobile.init_lesson 
          @lesson_mobile.lesson_words.each do |lesson_word|

            # tao list answer cho moi cau hoi
            list_answer = []
            @list_answers = WordAnswer.where(word_id: lesson_word.word_id)
            @list_answers.each do |l_a|
                answer_data = {
                  id: l_a.id,
                  content_answer: l_a.content,
                  correct: l_a.correct
                }
                list_answer << answer_data
            end
            # tao cau tra loi
            word_question = Word.where(id: lesson_word.word_id)

            lesson_data = {
              word_question: {
                id: word_question.first.id,
                content: word_question.first.content},
              list_answer: list_answer
            }
            @list_word_lesson << lesson_data
          end
          
# end create lesson sample
          respond_to do |format|
            format.html {render :new}
            format.json {render json:{error: :false, lesson: @list_word_lesson}, status: :ok}
          end
      

  end

  # create chi thuc hien khi nguoi dung submit cau tra loi
  def create

    # tao ra mot lesson.new va luu lai tat ca params nhan ve vao lesson va save lai
    category_id = params[:category_id]

    @lesson = Lesson.new
    @lesson.category_id = params[:category_id]

    if params[:user_id]
      @lesson.user_id = params[:user_id]
    else
      @lesson.user_id = current_user.id
    end

    @lesson.save

    @count = 0;
    # xu li tren web
    if params[:user_id]
      lesson_params.each do |val|
        word_answer_id = val.to_i
        word_id = WordAnswer.find(word_answer_id).word_id
        @lesson.lesson_words.new word_id: word_id, word_answer_id: word_answer_id
        if WordAnswer.find(word_answer_id).correct?
            @count += 1
        end
      end
    else
      lesson_params.each do |val|
        word_answer_id = val.to_i
        word_id = WordAnswer.find(word_answer_id).word_id
        @lesson.lesson_words.new word_id: word_id, word_answer_id: word_answer_id
        if WordAnswer.find(word_answer_id).correct?
            @count += 1
        end
      end

    end


    # xu li cho android
    @lesson.result = @count
    
    respond_to do |format|
      # if @lesson.save

        @lesson.save

        format.html { redirect_to lesson_path(@lesson) }
        format.json { render json: {error: false, message: "Update lesson succesful!"}, status: :ok }
      # else
      #   format.html { render :new }
      #   format.json { render json: @lesson.errors, status: :unprocessable_entity }
      # end
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
    # loc ra nhung param cos answer_word_id o dau
    word_ids = []
    params.each do |key, val|
      if key.index("answer_word_id").present?
        word_ids << val
      end
    end
    word_ids
  end
end