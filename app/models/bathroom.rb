class Bathroom < ApplicationRecord
  belongs_to :building
  has_many :critiques

  validate :gender_options, :valid_floor

  validates :gender, :floor, :location, presence: true

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
    input = self.gender.downcase
    male = ["man","men","male","males","m","boy","boys","guy","guys"]
    female = ["woman","women","female","females","f","girl","girls","lady","ladies"]
    unisex = ["unisex","nonbinary","non-binary"]
    if male.include?(input)
      self.gender = "Male"
    elsif female.inlcude?(input)
      self.gender = "Female"
    elsif unisex.include?(input)
      self.gender = "Unisex"
    end
  end

  #Forces gender to be from a prespecified set of allowed inputs
  #Validation makes sure it's on this list
  def gender_options
    recognized_genders = ["men","male","males","m","boy","boys","guy","guys","man",
      "woman","women","female","females","f","girl","girls","lady","ladies",
      "unisex","nonbinary","non-binary"]
    unless recognized_genders.include?(self.gender.downcase)
      self.errors[:base] << "Gender not recognized; please use Male, Female, or Unisex"
    end
  end

  def valid_floor
    floor = self.floor
    if !is_number?(floor) && floor.casecmp("L") != 0 && floor.casecmp("LL") != 0 && floor.casecmp("B") != 0
      self.errors[:base] << "Invalid floor"
    end
  end

  def is_number?(obj)
    return obj.is_a? Integer
  end

end
