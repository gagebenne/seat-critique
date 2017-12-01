require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'should have the necessary required validators' do
    tag = Tag.new
    assert_not tag.valid?
    assert_equal [:bathroom,:name], tag.errors.keys
  end
end
