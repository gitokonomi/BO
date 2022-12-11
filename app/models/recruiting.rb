class Recruiting < ApplicationRecord
  
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :recruiting_comments, dependent: :destroy
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
  def self.search_for(content, method)
    if method == 'perfect'
      Recruiting.where(title: content)
    elsif method == 'forward'
      Recruiting.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Recruiting.where('title LIKE ?', '%'+content)
    else
      Recruiting.where('title LIKE ?', '%'+content+'%')
    end
  end

end
