class Category < ActiveRecord::Base

  has_many :lesson, dependent: :destroy
  has_many :words, dependent: :destroy

  # validates :name, presence: true, length: {maximum: 30},
  #   uniqueness: {case_sensitive: false}
  # validates :description, presence:true, length: {maximum: 150},
  #   uniqueness: {case_sensitive: false}

end
