class Building < ApplicationRecord
  has_many :bathrooms

  #geocoded_by :address
  after_validation :geocode, if: :address_changed?

  before_save :strip_input

  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 65 }
  validates_presence_of :name, :address
  validates_uniqueness_of :name

  # Removes spaces, tabs, etc from beginning and end of input
  # PRE: All inputs are successfully validated
  # POST: Inputs are formatted to the webpage's style
  def strip_input
    self.name = self.name.to_s.strip
    self.address = self.address.to_s.strip
  end
end
