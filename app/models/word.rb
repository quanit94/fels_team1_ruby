class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words
  

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc{|a| a["content"].blank?}


    # Filter Word
  scope :all_word, ->user_id{}
  scope :learned, ->user_id{where("id in (select word_id from lesson_words where
    lesson_id in (select id from lessons where user_id = #{user_id}))")}
  scope :not_learn, ->user_id{where("id not in (select word_id from lesson_words where
    lesson_id in (select id from lessons where user_id = #{user_id}))")}

end
 