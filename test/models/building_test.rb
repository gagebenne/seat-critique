require 'test_helper'

class BuildingTest < ActiveSupport::TestCase

  test "cannot save empty building" do
    building = Building.new
    assert_not building.save
  end
  
end
