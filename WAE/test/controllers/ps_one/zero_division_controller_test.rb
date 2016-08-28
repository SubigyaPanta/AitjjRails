require 'test_helper'

class PsOne::ZeroDivisionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_one_zero_division_index_url
    assert_response :success
  end

end
