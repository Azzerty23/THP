class StrollDog < ApplicationRecord
  #StrollDog fait le liens entre Stroll et Dog.
  #C'est une table de jointure.
  belongs_to :stroll
  belongs_to :dog
end
