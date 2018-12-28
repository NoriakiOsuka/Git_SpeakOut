class Crossfollow < ApplicationRecord
  belongs_to :followable, polymorphic: true , optional: true 
  
  validates :followable_id, presence: true
  validates :st_user_or_ad_user, presence: true
  
  def st_user_or_ad_user
    st_user_id.presence or ad_user_id.presence 
  end
end
