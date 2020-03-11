class Frienship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :responder, class_name: "User"
end
