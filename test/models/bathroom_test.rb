require 'test_helper'

class BathroomTest < ActiveSupport::TestCase

  #All private methods get coverage through the validation tests

  test 'should have the necessary required validators' do
    bathroom = Bathroom.new
    assert_not bathroom.valid?
    assert_equal [:building, :base, :gender, :floor, :location], bathroom.errors.keys
  end

  test 'normal men\'s bathroom has no errors' do
    b = bathrooms(:mens)
    assert_equal [], b.errors.keys
  end

  test 'can\'t save invalid floor' do
    b = bathrooms(:badfloor)
    assert_not b.save
  end

  test 'average ratings work with no critiques' do
    b = bathrooms(:mens)
    b.save
    assert b.average_overall_rating
    assert b.average_toilet_rating
    assert b.average_sink_rating
    assert b.average_cleanliness_rating
    assert b.average_smell_rating
    assert b.average_privacy_rating
  end

end
