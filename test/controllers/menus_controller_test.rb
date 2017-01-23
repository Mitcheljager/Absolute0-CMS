require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get menus_create_url
    assert_response :success
  end

end
