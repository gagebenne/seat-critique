require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "cannot save empty user" do
    user = User.new
    assert_not user.save
  end
  
end
