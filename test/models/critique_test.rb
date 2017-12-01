require 'test_helper'

class CritiqueTest < ActiveSupport::TestCase

  test 'should have the necessary validators' do
    critique = Critique.new
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
  end

  test 'numericality validators work when value is too high' do
    critique = critiques(:high)
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
  end

  test 'numericality validators work when value is too low' do
    critique = critiques(:low)
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :overall_rating, :toilet_rating,
      :sink_rating, :cleanliness_rating, :smell_rating,
      :privacy_rating], critique.errors.keys
  end

  test 'edge cases work as intended' do
    critique = critiques(:edgecase)
    assert_not critique.valid?
    assert_equal [:user, :bathroom, :cleanliness_rating], critique.errors.keys
  end

  test 'valid critique has no errors' do
    critique = critiques(:valid)
    assert_equal [], critique.errors.keys
  end

end
