require "test_helper"

class DynamicTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dynamic_template = dynamic_templates(:one)
  end

  test "should get index" do
    get dynamic_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_dynamic_template_url
    assert_response :success
  end

  test "should create dynamic_template" do
    assert_difference("DynamicTemplate.count") do
      post dynamic_templates_url, params: { dynamic_template: { body: @dynamic_template.body, format: @dynamic_template.format, handler: @dynamic_template.handler, locale: @dynamic_template.locale, partial: @dynamic_template.partial, path: @dynamic_template.path } }
    end

    assert_redirected_to dynamic_template_url(DynamicTemplate.last)
  end

  test "should show dynamic_template" do
    get dynamic_template_url(@dynamic_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_dynamic_template_url(@dynamic_template)
    assert_response :success
  end

  test "should update dynamic_template" do
    patch dynamic_template_url(@dynamic_template), params: { dynamic_template: { body: @dynamic_template.body, format: @dynamic_template.format, handler: @dynamic_template.handler, locale: @dynamic_template.locale, partial: @dynamic_template.partial, path: @dynamic_template.path } }
    assert_redirected_to dynamic_template_url(@dynamic_template)
  end

  test "should destroy dynamic_template" do
    assert_difference("DynamicTemplate.count", -1) do
      delete dynamic_template_url(@dynamic_template)
    end

    assert_redirected_to dynamic_templates_url
  end
end
