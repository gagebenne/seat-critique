class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques
end
