require 'test_helper'

class UserPackageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_package_index_url
    assert_response :success
  end

end
