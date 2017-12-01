class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques
  has_many :tags

  validate :valid_floor
  validates :gender, :floor, :location, presence: true
  validates :location, length: { maximum: 50 }
  validates :floor, length: { maximum: 10 }
  validates_uniqueness_of :location, :scope => [:floor, :building_id]

  before_save :format_input

  # Calculates the average overall rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_overall_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.overall_rating }.to_f / critiques.size
  end

  # Calculates the average toilet rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_toilet_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.toilet_rating }.to_f / critiques.size
  end

  # Calculates the average sink rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_sink_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.sink_rating }.to_f / critiques.size
  end

  # Calculates the average cleanliness rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_cleanliness_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.cleanliness_rating }.to_f / critiques.size
  end

  # Calculates the average smell rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_smell_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.smell_rating }.to_f / critiques.size
  end

  # Calculates the average privacy rating
  # PRE: At least one rating exists
  # POST: The average is computed
  def average_privacy_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.privacy_rating }.to_f / critiques.size
  end

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
    if !is_number?(floor) && floor.casecmp("L") != 0 && floor.casecmp("LL") != 0 && floor.casecmp("B") != 0 && floor.casecmp("G") != 0
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
