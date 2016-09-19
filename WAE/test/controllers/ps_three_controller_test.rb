require 'test_helper'

class PsThreeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_three_index_url
    assert_response :success
  end

end
