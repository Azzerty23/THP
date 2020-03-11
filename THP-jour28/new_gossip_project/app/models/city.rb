class City < ApplicationRecord
  has_many :users
  has_many :gossips, through: :users
  has_many :comments, through: :gossips
  has_many :likes, through: :gossips
end
