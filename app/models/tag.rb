class Tag < ApplicationRecord
  belongs_to :bathroom

  validates_presence_of :name
end
