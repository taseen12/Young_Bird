require 'test_helper'

class VideoToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_tours_index_url
    assert_response :success
  end

end
