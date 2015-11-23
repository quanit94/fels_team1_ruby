class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words
  

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc{|a| a["content"].blank?}


  scope :not_learn, -> id_user, id_category{Word.where "category_id = ? AND id NOT IN
    (SELECT word_id FROM lesson_words WHERE lesson_id IN 
      (SELECT id FROM lessons WHERE user_id = ?))", id_category, id_user}
  
  scope :learned, -> id_user, id_category{Word.where "category_id = ? AND id IN
    (SELECT word_id FROM lesson_words WHERE lesson_id IN 
      (SELECT id FROM lessons WHERE user_id = ?))", id_category, id_user}


  def correct_answer
    self.word_answers.where(correct: true).first
  end

end
 