require 'test_helper'

class UserHotelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_hotel_index_url
    assert_response :success
  end

end
