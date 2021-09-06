require "test_helper"

class MedsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get meds_show_url
    assert_response :success
  end

  test "should get index" do
    get meds_index_url
    assert_response :success
  end
end
