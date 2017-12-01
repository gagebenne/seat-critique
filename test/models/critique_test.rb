require 'test_helper'

class CritiqueTest < ActiveSupport::TestCase

  test "cannot save empty critique" do
    critique = Critique.new
    assert_not critique.save
  end

  test 'should have the necessary validators' do
    critique = Critique.new
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
  end

  test 'numericality validators work when value is too high' do
    critique = Critique.new
    critique.overall_rating = 6
    critique.toilet_rating = 60
    critique.sink_rating = 1337
    critique.cleanliness_rating = 80
    critique.smell_rating = 100
    critique.privacy_rating = 8.888
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
  end

  test 'numericality validators work when value is too low' do
    critique = Critique.new
    critique.overall_rating = 0
    critique.toilet_rating = -30
    critique.sink_rating = -1.5
    critique.cleanliness_rating = -5
    critique.smell_rating = -100
    critique.privacy_rating = -1337
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
    end


end
