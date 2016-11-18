require 'test_helper'

class User::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_profile_index_url
    assert_response :success
  end

end
