require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "cannot save empty user" do
    user = User.new
    assert_not user.save
  end

  test 'should validate presence of gender' do
    user = User.new
    assert_not user.valid?
    assert user.errors.keys.include?(:gender)
  end
  
end
