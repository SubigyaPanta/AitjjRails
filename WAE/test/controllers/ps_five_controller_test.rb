require 'test_helper'

class PsFiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_five_index_url
    assert_response :success
  end

  test "should get documentation" do
    get ps_five_documentation_url
    assert_response :success
  end

end
