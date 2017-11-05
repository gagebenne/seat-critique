require 'test_helper'

class CritiquesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get critiques_index_url
    assert_response :success
  end

  test "should get show" do
    get critiques_show_url
    assert_response :success
  end

  test "should get edit" do
    get critiques_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get critiques_destroy_url
    assert_response :success
  end

end
