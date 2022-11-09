require 'test_helper'

class PaymentHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_histories_index_url
    assert_response :success
  end

end
