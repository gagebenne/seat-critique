class Building < ApplicationRecord
  has_many :bathrooms

  :strip_input

  before_save :strip_input
  #Validates data before entering it into the db,
  #checks that each field exists and name is unique
  #validates :name, uniqueness: {message: "Building already exists!"}, on: :create
  validate :name_cannot_be_bad, :address_must_exist

  private

  #removes spaces, tabs, etc from beginning and end of input
  def strip_input
    self.name = self.name.strip
    self.address = self.address.strip
  end

  #makes sure building name is not empty, and name is unique
  def name_cannot_be_bad
    if self.name.strip == ""
      self.errors[:base] << "Building name cannot be empty!"
    elsif Building.exists? name: self.name.strip
      self.errors[:base] << self.name + " already exists!"
    end
  end

  #make sure address is not empty
  def address_must_exist
    if self.address.strip == ""
      self.errors[:base] << "Building must have an address!"
    end
  end


end
