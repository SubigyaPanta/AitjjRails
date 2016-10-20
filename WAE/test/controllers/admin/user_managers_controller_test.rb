require 'test_helper'

class Admin::UserManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user_manager = admin_user_managers(:one)
  end

  test "should get index" do
    get admin_user_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_manager_url
    assert_response :success
  end

  test "should create admin_user_manager" do
    assert_difference('Admin::UserManager.count') do
      post admin_user_managers_url, params: { admin_user_manager: {  } }
    end

    assert_redirected_to admin_user_manager_url(Admin::UserManager.last)
  end

  test "should show admin_user_manager" do
    get admin_user_manager_url(@admin_user_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_manager_url(@admin_user_manager)
    assert_response :success
  end

  test "should update admin_user_manager" do
    patch admin_user_manager_url(@admin_user_manager), params: { admin_user_manager: {  } }
    assert_redirected_to admin_user_manager_url(@admin_user_manager)
  end

  test "should destroy admin_user_manager" do
    assert_difference('Admin::UserManager.count', -1) do
      delete admin_user_manager_url(@admin_user_manager)
    end

    assert_redirected_to admin_user_managers_url
  end
end
