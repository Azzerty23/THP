class Stroll < ApplicationRecord
  #Stroll est lié aux chiens par le bien de la table de jointures Stroll_Dog.
  has_many :stroll_dogs
  has_many :dogs, through: :stroll_dogs
  #Une balade à directement l'ID d'un DogSitters
  belongs_to :dogsitter
end
