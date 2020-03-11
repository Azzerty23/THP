class Gossip < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  scope :hidden, -> {where(privacy: 1)}
  scope :visible, -> {where(privacy: 0)}

end
