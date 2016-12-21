require 'test_helper'

class BlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blocks_new_url
    assert_response :success
  end

  test "should get edit" do
    get blocks_edit_url
    assert_response :success
  end

  test "should get show" do
    get blocks_show_url
    assert_response :success
  end

end
