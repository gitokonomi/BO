class Recruiting < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :recruiting_comments, dependent: :destroy
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  

  def self.search_for(content)
    Recruiting.where('title LIKE ? OR body LIKE ?', '%'+content+'%', '%'+content+'%')
  end
  
  def self.search_for_time(content)
    Recruiting.where('date LIKE ?', '%'+content+'%')
  end

end
