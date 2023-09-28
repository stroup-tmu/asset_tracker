require "test_helper"

class BaseControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get base_dashboard_url
    assert_response :success
  end
end
