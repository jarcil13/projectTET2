require 'test_helper'

class TryControllerTest < ActionDispatch::IntegrationTest
  test "should get api" do
    get try_api_url
    assert_response :success
  end

end
