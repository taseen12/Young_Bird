require 'test_helper'

class UserPlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_place_index_url
    assert_response :success
  end

end
