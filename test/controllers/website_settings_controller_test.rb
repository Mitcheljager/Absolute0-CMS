require 'test_helper'

class WebsiteSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get website_settings_edit_url
    assert_response :success
  end

end
