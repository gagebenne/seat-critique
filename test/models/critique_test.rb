require 'test_helper'

class CritiqueTest < ActiveSupport::TestCase

  test "cannot save empty critique" do
    critique = Critique.new
    assert_not critique.save
  end
  
end
