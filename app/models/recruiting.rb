class Recruiting < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :recruiting_comments, dependent: :destroy
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
