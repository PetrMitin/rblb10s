require "test_helper"

class AuthomorphNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get authomorph_numbers_input_url
    assert_response :success
  end

  test "should get view" do
    get authomorph_numbers_view_url
    assert_response :success
  end
end
