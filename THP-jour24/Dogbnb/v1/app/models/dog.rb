class Dog < ApplicationRecord
  has_many :strolls
  has_many :dogsitters, through: :strolls
  belongs_to :city, optional: true
  has_many :stroll_dogs
  has_many :strolls, through: :stroll_dogs
end
