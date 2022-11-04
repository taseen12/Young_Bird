require 'test_helper'

class PackageDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get package_details_index_url
    assert_response :success
  end

end
