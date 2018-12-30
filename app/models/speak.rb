class Speak < ApplicationRecord
  belongs_to  :st_user
  has_many  :comments , dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :adiine_users, through: :likes, source: :ad_user
  has_many :stiine_users, through: :likes, source: :st_user
  
  validates_presence_of :st_user_id, :text, :field, :subject
  
  def adiine(ad_user)
    likes.create!(ad_user_id: ad_user.id)
  end

  def stiine(st_user)
    likes.create!(st_user_id: st_user.id)
  end
  
  def aduniine(ad_user)
    likes.find_by(ad_user_id: ad_user.id).destroy!
  end
  
  def stuniine(st_user)
    likes.find_by(st_user_id: st_user.id).destroy!
  end
  
  def adiine?(ad_user)
    adiine_users.include?(ad_user)
  end
  
  def stiine?(st_user)
    stiine_users.include?(st_user)
  end
  
end
