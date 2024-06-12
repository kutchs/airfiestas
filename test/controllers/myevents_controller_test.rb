require "test_helper"

class MyeventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myevents_index_url
    assert_response :success
  end
end
