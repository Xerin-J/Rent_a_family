require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get guests_dashboard_url
    assert_response :success
  end
end
