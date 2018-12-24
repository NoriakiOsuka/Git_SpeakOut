class Speak < ApplicationRecord
  belongs_to  :st_user
  
  validates_presence_of :st_user_id, :text, :field, :subject
end
