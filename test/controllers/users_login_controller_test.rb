require "test_helper"

class UsersLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_login_new_url
    assert_response :success
  end
end
