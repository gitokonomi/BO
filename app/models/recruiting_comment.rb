class RecruitingComment < ApplicationRecord
  belongs_to :user
  belongs_to :recruiting
end
