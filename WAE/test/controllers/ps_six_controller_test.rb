require 'test_helper'

class PsSixControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_six_index_url
    assert_response :success
  end

  test "should get web10" do
    get ps_six_web10_url
    assert_response :success
  end

  test "should get web11" do
    get ps_six_web11_url
    assert_response :success
  end

  test "should get customer" do
    get ps_six_customer_url
    assert_response :success
  end

end
