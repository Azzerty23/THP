class Dog < ApplicationRecord
  #Mise en place des liens pour Dog
  #Dog a plusieurs promenade par le biais de la jointure "Stroll_dogs".
  #Dog sera lié aux DogSitters par le biais de la table stroll
  has_many :stroll_dogs
  has_many :strolls, through: :stroll_dogs
  has_many :dogsitters, through: :strolls
  belongs_to :city
end
