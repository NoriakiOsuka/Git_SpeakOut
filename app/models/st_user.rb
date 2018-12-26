class StUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :speaks, ->{ order("created_at DESC") }
  
  validates :first_name,:family_name,:first_name_kana,:family_name_kana,:school,:grade,:nickname,   presence: true
  
  has_one_attached :image
  
  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end
end
