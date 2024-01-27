require "test_helper"

class InnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inners_index_url
    assert_response :success
  end
end
