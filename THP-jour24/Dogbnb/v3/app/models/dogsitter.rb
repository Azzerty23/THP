class Dogsitter < ApplicationRecord
  #Mise en place des liens de Dogsitters.
  #Dogsitter à plusieurs ballades.
  #Sera lié à plusieurs chiens grâce à la table de jointure liant les strolls aux Dogs.
  has_many :strolls
  has_many :dogs, through: :strolls
  #Dogsitters est lié à une seule ville.
  belongs_to :city
end
