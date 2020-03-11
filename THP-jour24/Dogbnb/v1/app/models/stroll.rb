class Stroll < ApplicationRecord
  belongs_to :dogsitter
  belongs_to :city, optional: true
  belongs_to :dog
  has_many :stroll_dogs
  has_many :dogs, through: :stroll_dogs
end
