class Speak < ApplicationRecord
  belongs_to  :st_user
  has_many  :comments
  
  validates_presence_of :st_user_id, :text, :field, :subject
end
