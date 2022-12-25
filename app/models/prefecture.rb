class Prefecture < ApplicationRecord
  has_many :areas, dependent: :destroy
  has_many :recruitings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
