class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson, foreign_key: :target_id 
  
end
