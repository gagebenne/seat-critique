class Building < ApplicationRecord
  has_many :bathrooms
  geocoded_by :address

  before_save :strip_input

  #Validates data before entering it into the db,
  #checking that each field exists and name is unique
  validate :name_cannot_be_bad, :address_must_exist, on: :create
  validate :edit_valid_name, :address_must_exist2, on: :update

  private

  #removes spaces, tabs, etc from beginning and end of input
  def strip_input
    self.name = self.name.strip
    self.address = self.address.strip
  end

  #makes sure building name is not empty, and name is unique
  def name_cannot_be_bad
    if self.name.strip == ""
      self.errors[:base] << "Building name cannot be empty"
    elsif Building.exists? name: self.name.strip
      self.errors[:base] << self.name.strip + " already exists"
    end
  end

  #make sure address is not empty
  def address_must_exist
    if self.address.strip == ""
      self.errors[:base] << "Building must have an address"
    end
  end

  #For some reason, validation doesn't work when two validators call
  #the same method. So, this simply redirects to the other one.
  def address_must_exist2
    address_must_exist
  end

  #when editing a building, the name can be the old name, but no other
  #names in the database. We check that here.
  def edit_valid_name
    if self.name.strip == ""
      self.errors[:base] << "Building name cannot be empty"
    elsif Building.exists? name: self.name.strip
      oldName = Building.find(self.id).name
      #change to casecmp?
      if self.name.strip != oldName
        self.errors[:base] << self.name.strip + " already exists"
      end
    end
  end

end
