require 'test_helper'

class Admin::UserManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_manager_index_url
    assert_response :success
  end

end
