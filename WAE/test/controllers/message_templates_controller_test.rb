require 'test_helper'

class MessageTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_template = message_templates(:one)
  end

  test "should get index" do
    get message_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_message_template_url
    assert_response :success
  end

  test "should create message_template" do
    assert_difference('MessageTemplate.count') do
      post message_templates_url, params: { message_template: { message: @message_template.message, name: @message_template.name } }
    end

    assert_redirected_to message_template_url(MessageTemplate.last)
  end

  test "should show message_template" do
    get message_template_url(@message_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_template_url(@message_template)
    assert_response :success
  end

  test "should update message_template" do
    patch message_template_url(@message_template), params: { message_template: { message: @message_template.message, name: @message_template.name } }
    assert_redirected_to message_template_url(@message_template)
  end

  test "should destroy message_template" do
    assert_difference('MessageTemplate.count', -1) do
      delete message_template_url(@message_template)
    end

    assert_redirected_to message_templates_url
  end
end
