class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words
  

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc{|a| a["content"].blank?}


  scope :not_learn, -> (id_user, id_category){Word.where "category_id = ? AND id NOT IN
    (SELECT word_id FROM lesson_words WHERE lesson_id IN 
      (SELECT id FROM lessons WHERE user_id = ?))", id_category, id_user}

  # scope :learned, -> (user_id, category_id){where(id: LessonWord.where(lesson_id: Lesson.where(user_id: user_id).pluck(:id)), category_id: category_id)}

  # scope :not_learn, -> (user_id, category_id){where.not(id: LessonWord.where(lesson_id: Lesson.where(user_id: user_id).pluck(:id)), category_id: category_id)}


end
 