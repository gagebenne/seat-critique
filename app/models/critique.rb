class Critique < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  private

end
