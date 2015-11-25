class Lesson < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  belongs_to :user
  belongs_to :category

  default_scope -> {order created_at: :desc}
  accepts_nested_attributes_for :lesson_words, allow_destroy: true
  

  after_save :update_result
  after_save :store_activity
  
  #validate :check_number_words, on: :create

  
  def init_lesson
    list_word = Word.not_learn(self.user_id, self.category_id).sample(Settings.number_result)
    list_word.each do |word|
      self.lesson_words.build word_id: word.id
    end
  end

  private
  def update_result
    self.result = self.lesson_words.select{|result| result.word_answer.try(:correct)}.count
  end

  def check_number_words
    list_word = Word.not_learn self.user_id, self.category_id
    if list_word.size < Settings.number_lesson_word 
      errors.add :words, I18n.t("not_enough_word")
    end
  end

  
  def store_activity
    self.user.activities.create(target_id: self.id, action_type: 'learned')
  end
    



end
