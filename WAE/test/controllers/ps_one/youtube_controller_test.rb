require 'test_helper'

class YoutubeControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get youtube_fetch_url
    assert_response :success
  end

end
