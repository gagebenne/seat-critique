require 'test_helper'

class BuildingTest < ActiveSupport::TestCase

  test 'should have the necessary required validators' do
    building = Building.new
    assert_not building.valid?
    assert_equal [:name, :address], building.errors.keys
  end

  test 'cannot save empty building' do
    building = Building.new
    assert_not building.save
  end

  test 'can save normal building' do
    building = buildings(:normal)
    assert building.save
  end

  test 'can\'t save building without name' do
    building = buildings(:nameless)
    assert_not building.save
  end

  test 'can\'t save building without address' do
    building = buildings(:addressless)
    assert_not building.save
  end

  test 'can\'t save two buildings with the same name' do
    building = buildings(:normal)
    building2 = buildings(:normal2)
    building.save
    assert_not building2.save
  end

end
