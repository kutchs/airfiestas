require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservations_new_url
    assert_response :success
  end

  test "should get update" do
    get reservations_update_url
    assert_response :success
  end
end
