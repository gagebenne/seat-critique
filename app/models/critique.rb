class Critique < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  before_save :strip_input

  private

  def strip_input
    
  end

end
