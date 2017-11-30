class Critique < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  #Simple forms will validate that only integers are accepted
  #We do not need to check for that.

  validates_presence_of :overall_rating, :toilet_rating, :sink_rating,
  :cleanliness_rating, :smell_rating, :privacy_rating
  validates :overall_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :toilet_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :sink_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :cleanliness_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :smell_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :privacy_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  
end
