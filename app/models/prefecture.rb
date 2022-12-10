class Prefecture < ApplicationRecord
  has_many :areas
  has_many :recruitings
end
