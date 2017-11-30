class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques
  has_many :tags

  validate :valid_floor
  validates :gender, :floor, :location, presence: true
  validates :location, length: { maximum: 50 }
  validates :floor, length: { maximum: 10 }
  
  before_save :format_input

  private

  # Removes spaces, tabs, etc from beginning and end of input
  # PRE: All inputs are successfully validated
  # POST: Inputs are formatted to the webpage's style
  def format_input
    self.gender = self.gender.strip
    self.floor = self.floor.strip.upcase
    self.location = self.location.strip
  end

  # Checks if the floor number input is a valid
  # PRE: None
  # POST: If invalid, pushes an error to the page
  def valid_floor
    floor = self.floor.to_s
    if !is_number?(floor) && floor.casecmp("L") != 0 && floor.casecmp("LL") != 0 && floor.casecmp("B") != 0
      self.errors[:base] << "Invalid floor"
    end
  end

  # Checks if a string can be parsed to an integer
  # PRE: None
  # POST: None
  def is_number?(obj)
    return obj.to_s == obj.to_i.to_s
  end

end
