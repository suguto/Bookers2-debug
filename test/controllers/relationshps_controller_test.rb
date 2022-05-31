require "test_helper"

class RelationshpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get relationshps_index_url
    assert_response :success
  end
end
