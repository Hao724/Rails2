require "test_helper"

class RoomsReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rooms_reservations_index_url
    assert_response :success
  end
end
