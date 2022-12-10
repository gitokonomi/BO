class Recruiting < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
