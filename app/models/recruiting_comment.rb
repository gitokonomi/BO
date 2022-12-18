class RecruitingComment < ApplicationRecord
  belongs_to :user
  belongs_to :recruiting
  has_many :notifications, dependent: :destroy
  
end
