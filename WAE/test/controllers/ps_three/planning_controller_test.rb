require 'test_helper'

class PsThree::PlanningControllerTest < ActionDispatch::IntegrationTest
  test "should get docs" do
    get ps_three_planning_docs_url
    assert_response :success
  end

  test "should get akhil" do
    get ps_three_planning_akhil_url
    assert_response :success
  end

  test "should get sainath" do
    get ps_three_planning_sainath_url
    assert_response :success
  end

  test "should get rajesh" do
    get ps_three_planning_rajesh_url
    assert_response :success
  end

end
