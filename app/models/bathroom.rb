class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques

  validate :valid_floor

  validates :gender, :floor, :location, presence: true

  before_save :format_input

  private

  #removes spaces, tabs, etc from beginning and end of input
  def format_input
    self.gender = self.gender.strip
    self.floor = self.floor.strip.upcase
    self.location = self.location.strip
  end

  def valid_floor
    floor = self.floor.to_s
    if !is_number?(floor) && floor.casecmp("L") != 0 && floor.casecmp("LL") != 0 && floor.casecmp("B") != 0
      self.errors[:base] << "Invalid floor"
    end
  end

  def is_number?(obj)
    return obj.to_s == obj.to_i.to_s
  end

end
