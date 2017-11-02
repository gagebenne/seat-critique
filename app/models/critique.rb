class Critique < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  validate :in_range

  private

  def in_range
    # self.errors[:base] << "self.overall_rating"
    # if self.overall_rating == ""
    #   self.errors[:base] << "Must give an overall rating"
    # elsif self.overall_rating < 1 || self.overall_rating > 10
    #   self.errors[:base] << "Overall rating must be between 1 and 10"
    # end
    #
    # if self.toilet_rating == ""
    #   self.errors[:base] << "Must give a toilet rating"
    # elsif self.toilet_rating < 1 || self.toilet_rating > 10
    #   self.errors[:base] << "Toilet rating must be between 1 and 10"
    # end
    #
    # if self.sink_rating == ""
    #   self.errors[:base] << "Must give a sink rating"
    # elsif self.sink_rating < 1 || self.sink_rating > 10
    #   self.errors[:base] << "Sink rating must be between 1 and 10"
    # end
    #
    # if self.cleanliness_rating == ""
    #   self.errors[:base] << "Must give a cleanliness rating"
    # elsif self.cleanliness_rating < 1 || self.cleanliness_rating > 10
    #   self.errors[:base] << "Cleanliness rating must be between 1 and 10"
    # end
    #
    # if self.smell_rating == ""
    #   self.errors[:base] << "Must give a smell rating"
    # elsif self.smell_rating < 1 || self.smell_rating > 10
    #   self.errors[:base] << "Smell rating must be between 1 and 10"
    # end
    #
    # if self.privacy_rating == ""
    #   self.errors[:base] << "Must give a privacy rating"
    # elsif self.privacy_rating < 1 || self.privacy_rating > 10
    #   self.errors[:base] << "Privacy rating must be between 1 and 10"
    # end
  end

end
