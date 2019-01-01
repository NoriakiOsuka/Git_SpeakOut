class StUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :speaks, ->{ order("created_at DESC") }
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :crossfollows, as: :followable, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  
  validates :first_name,:family_name,:first_name_kana,:family_name_kana,:school,:grade,:nickname,   presence: true
  
  has_one_attached :image
  
  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end
  
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  
  # def crossfollowing?(other_user)
    
  #   Crossfollow.find_by(st_user_id: other_user.id)
  # end

  # def stcrossfollow!(other_user)
  #   Crossfollow.create!(st_user_id: other_user.id)
  # end
  
  # def adcrossfollow!(other_user)
  #   Crossfollow.create!(ad_user_id: other_user.id)
  # end

  def stcrossunfollow!(other_user)
    Crossfollow.find_by(st_user_id: other_user.id).destroy
  end  
    
  def  adcrossunfollow!(other_user)
    Crossfollow.find_by(ad_user_id: other_user.id).destroy
  end
  
end
