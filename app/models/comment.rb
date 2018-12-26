class Comment < ApplicationRecord
  belongs_to :ad_user , optional: true 
  belongs_to :st_user , optional: true 
  belongs_to :speak, optional: true 
  
  validates :ad_user_or_st_user,:text,:log_grade,:exp_grade,:cre_grade,   presence: true

  private
    def ad_user_or_st_user
      ad_user.presence or st_user.presence
    end
  
end
