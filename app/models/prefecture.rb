class Prefecture < ApplicationRecord
  has_many :areas
  has_many :recruitings

  validates :name, presence: true, uniqueness: true
end
