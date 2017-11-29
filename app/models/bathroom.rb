class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques
  has_many :tags

  validate :valid_floor

  validates :gender, :floor, :location, presence: true

  before_save :format_input

  def average_overall_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.overall_rating }.to_f / critiques.size
  end

  def average_toilet_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.toilet_rating }.to_f / critiques.size
  end

  def average_sink_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.sink_rating }.to_f / critiques.size
  end

  def average_cleanliness_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.cleanliness_rating }.to_f / critiques.size
  end

  def average_smell_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.smell_rating }.to_f / critiques.size
  end

  def average_privacy_rating
    critiques = self.critiques
    critiques.reduce(0){ |sum, el| sum + el.privacy_rating }.to_f / critiques.size
  end

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
