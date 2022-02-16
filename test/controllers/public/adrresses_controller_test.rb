require "test_helper"

class Public::AdrressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_adrresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_adrresses_edit_url
    assert_response :success
  end
end
