require 'test_helper'

class ColumnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get columns_new_url
    assert_response :success
  end

  test "should get edit" do
    get columns_edit_url
    assert_response :success
  end

  test "should get show" do
    get columns_show_url
    assert_response :success
  end

end
