require 'test_helper'

class PsTwo::QuotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ps_two_quotation = ps_two_quotations(:one)
  end

  test "should get index" do
    get ps_two_quotations_url
    assert_response :success
  end

  test "should get new" do
    get new_ps_two_quotation_url
    assert_response :success
  end

  test "should create ps_two_quotation" do
    assert_difference('PsTwo::Quotation.count') do
      post ps_two_quotations_url, params: { ps_two_quotation: { ps_two_authors_id: @ps_two_quotation.ps_two_authors_id, ps_two_categories_id: @ps_two_quotation.ps_two_categories_id, quote: @ps_two_quotation.quote } }
    end

    assert_redirected_to ps_two_quotation_url(PsTwo::Quotation.last)
  end

  test "should show ps_two_quotation" do
    get ps_two_quotation_url(@ps_two_quotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_ps_two_quotation_url(@ps_two_quotation)
    assert_response :success
  end

  test "should update ps_two_quotation" do
    patch ps_two_quotation_url(@ps_two_quotation), params: { ps_two_quotation: { ps_two_authors_id: @ps_two_quotation.ps_two_authors_id, ps_two_categories_id: @ps_two_quotation.ps_two_categories_id, quote: @ps_two_quotation.quote } }
    assert_redirected_to ps_two_quotation_url(@ps_two_quotation)
  end

  test "should destroy ps_two_quotation" do
    assert_difference('PsTwo::Quotation.count', -1) do
      delete ps_two_quotation_url(@ps_two_quotation)
    end

    assert_redirected_to ps_two_quotations_url
  end
end
