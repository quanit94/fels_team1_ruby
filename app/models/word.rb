class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words
  has_many :results
  

  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: proc{|a| a["content"].blank?}


end
 