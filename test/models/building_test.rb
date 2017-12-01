require 'test_helper'

class BuildingTest < ActiveSupport::TestCase

  test 'should have the necessary required validators' do
    building = Building.new
    assert_not building.valid?
    assert_equal [:name, :address], building.errors.keys
  end

  test 'cannot save empty building' do
    building = Building.new
    assert_not building.valid?
  end

  test 'normal building has no errors' do
    building = buildings(:normal)
    assert_equal [], building.errors.keys
  end

  test 'can\'t save building without name' do
    building = buildings(:nameless)
    assert_not building.valid?
  end

  test 'can\'t save building without address' do
    building = buildings(:addressless)
    assert_not building.valid?
  end

  test 'can\'t save two buildings with the same name' do
    building = buildings(:normal)
    building2 = buildings(:normal2)
    building.save
    assert_not building2.save
  end

  test 'strip_input works as expected' do
    building = buildings(:spaces)
    building.strip_input
    assert_equal building.name, 'Cooler Building'
    assert_equal building.address, '123 Fake Street'
  end

  test 'strip_input does nothing to a properly formatted building' do
    building = buildings(:normal)
    building.strip_input
    assert_equal building.name, 'Cool Building'
    assert_equal building.address, '123 Main St'
  end

end
