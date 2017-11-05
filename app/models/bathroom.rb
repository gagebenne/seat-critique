class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques

  validate :gender_options, :valid_floor, :validate_location

  before_save :format_input, :unify_gender

  private

  #removes spaces, tabs, etc from beginning and end of input
  def format_input
    self.gender = self.gender.strip
    self.floor = self.floor.strip.upcase
    self.location = self.location.strip
  end

  #Converts all allowable gender inputs into either
  #'Male' or 'Female'
  def unify_gender
    gender = "nil"
    input = self.gender.strip
    male = ["Men","Male","M","Boy","Guy","Man"]
    female = ["Women","Female","F","Girl","Lady","Ladie","Woman"]
    male.each do |name|
      if input.casecmp(name) == 0 || input.casecmp(name+"s") == 0
        gender = "Male"
      end
    end
    female.each do |name|
      if input.casecmp(name) == 0 || input.casecmp(name+"s") == 0
        gender = "Female"
      end
    end
    self.gender = gender
  end

  #Forces gender to be from a prespecified set of allowed inputs
  #Validation makes sure it's on this list
  def gender_options
    input = self.gender.strip
    inList = false
    #specifically avoids plurals since we will check for that too
    allowed = Array["Men","Male","M","Boy","Guy","Man",
    "Women","Female","F","Girl","Lady","Ladie","Woman"]
    allowed.each do |name|
      if input.casecmp(name) == 0 || (input).casecmp(name+"s") == 0
        inList = true
      end
    end
    if(!inList)
      self.errors[:base] << "Gender not recognized; please use Male or Female"
    end
  end

  def valid_floor
    name = self.floor.strip
    if name == ""
      self.errors[:base] << "Must provide a floor number"
    elsif !is_number?(name) && name.casecmp("L") != 0 && name.casecmp("LL") != 0 && name.casecmp("B") != 0
      self.errors[:base] << "Invalid floor"
    end
  end

  def is_number?(obj)
    return obj.to_s == obj.to_i.to_s
  end

  def validate_location
    if self.location.strip == ""
      self.errors[:base] << "Must specify a location"
    end
  end

end
