class Recruiting < ApplicationRecord

  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :recruiting_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :date, presence: true
  validates :place, presence: true, length: { maximum: 20 }
  validates :deadline, presence: true
  validates :body, presence: true, length: { maximum: 150 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  # いいね通知用メソッド
  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and recruiting_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        recruiting_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は通知しない
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知用メソッド
  def create_notification_comment!(current_user, recruiting_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知
    temp_ids = RecruitingComment.select(:user_id).where(recruiting_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, recruiting_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, recruiting_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, recruiting_comment_id, visited_id)
    # 複数回コメントで、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      recruiting_id: id,
      recruiting_comment_id: recruiting_comment_id,
      visited_id: visited_id,
      action: 'recruiting_comment'
    )
    # 自分の投稿に対するコメントの場合は通知しない
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  # 検索用メソッド
  def self.search_for(content)
    Recruiting.where('title LIKE ? OR body LIKE ?', '%'+content+'%', '%'+content+'%')
  end

  # def self.search_for_time(content)
  #   Recruiting.where('date LIKE ?', '%'+content+'%')
  # end

  def self.search_prefecture_for(content)
    Recruiting.where(prefecture_id: content)
  end


end
