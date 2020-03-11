class StrollDog < ApplicationRecord
  belongs_to :dog, foreign_key: true
  belongs_to :stroll, foreign_key: true
end
 