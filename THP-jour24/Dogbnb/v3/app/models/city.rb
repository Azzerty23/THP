class City < ApplicationRecord
  #Une ville est liée à plusieurs Dogs et plusieurs Dogsitters
  has_many :dogs
  has_many :dogsitters
end
