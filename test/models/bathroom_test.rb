require 'test_helper'

class BathroomTest < ActiveSupport::TestCase

  test "cannot save empty bathroom" do
    bathroom = Bathroom.new
    assert_not bathroom.save
  end

  test 'can save normal men\'s bathroom' do
    b = bathrooms(:mens)
    assert b.save
  end
  
end
