require 'test_helper'

class PsFourControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_four_index_url
    assert_response :success
  end

end
