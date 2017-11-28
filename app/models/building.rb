class Building < ApplicationRecord
  has_many :bathrooms
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  before_save :strip_input

  validates_presence_of :name, :address
  validates_uniqueness_of :name

  private

  #removes spaces, tabs, etc from beginning and end of input
  def strip_input
    self.name = self.name.to_s.strip
    self.address = self.address.to_s.strip
  end
end
