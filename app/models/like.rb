class Like < ApplicationRecord
  belongs_to :speak  , optional: true 
  belongs_to :st_user , optional: true 
  belongs_to :ad_user , optional: true 
  counter_culture :speak
  
  validates :ad_user_or_st_user, presence: true
  validates :speak_id, presence: true
  
  def ad_user_or_st_user
    ad_user_id.presence or st_user_id.presence 
  end
  
end
