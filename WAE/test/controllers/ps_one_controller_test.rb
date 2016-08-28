require 'test_helper'

class PsOneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_one_index_url
    assert_response :success
  end

end
