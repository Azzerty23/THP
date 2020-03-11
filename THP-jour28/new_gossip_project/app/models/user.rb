class User < ApplicationRecord
  has_secure_password
  
  has_many :gossips, foreign_key: "author_id", class_name: "Gossip"
  has_many :comments, foreign_key: "commenter_id", class_name: "Comment"
  has_many :likes, foreign_key: "liker_id", class_name: "Like"
  has_many :askers, foreign_key: "asker_id", class_name: "Friendship"
  has_many :responders, foreign_key: "responder_id", class_name: "Friendship"
  belongs_to :city, optional: true
end
