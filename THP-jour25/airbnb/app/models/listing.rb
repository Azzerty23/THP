class Listing < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :administrator, class_name: "User"
  belongs_to :city

  validates :available_beds,
    presence: true, # implicit with numericality which doesn't allow nil
    numericality: { only_integer: true, greater_than: 0 }

  validates :price,
    numericality: { only_integer: true, greater_than: 0 }

  validates :description,
    presence: true,
    length: { minimum: 140 }

  validates :welcome_message,
    presence: true
end
