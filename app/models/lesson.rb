class Lesson < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  belongs_to :user
  belongs_to :category

  default_scope -> {order created_at: :desc}
  accepts_nested_attributes_for :lesson_words, allow_destroy: true
  
  before_create :init_lesson
  before_save :update_result
  
  #validate :check_number_words, on: :create

  private
  def init_lesson
    list_word = Word.not_learn self.user_id, self.category_id
    number = list_word.length
    number = number > Settings.number_result ? Settings.number_result : number
    number.times do |n|
      self.lesson_words.build word_id: list_word[n].id
    end
  end

  def update_result
    self.result = self.lesson_words.select{|result| result.word_answer.try(:correct)}.count
  end

  def check_number_words
    list_word = Word.not_learn self.user_id, self.category_id
    if list_word.size < Settings.number_lesson_word 
      errors.add :words, I18n.t("not_enough_word")
    end
  end
end
