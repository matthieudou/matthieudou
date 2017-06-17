require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get timer" do
    get applications_timer_url
    assert_response :success
  end

end
