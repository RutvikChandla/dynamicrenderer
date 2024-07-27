require "application_system_test_case"

class DynamicTemplatesTest < ApplicationSystemTestCase
  setup do
    @dynamic_template = dynamic_templates(:one)
  end

  test "visiting the index" do
    visit dynamic_templates_url
    assert_selector "h1", text: "Dynamic templates"
  end

  test "should create dynamic template" do
    visit dynamic_templates_url
    click_on "New dynamic template"

    fill_in "Body", with: @dynamic_template.body
    fill_in "Format", with: @dynamic_template.format
    fill_in "Handler", with: @dynamic_template.handler
    fill_in "Locale", with: @dynamic_template.locale
    check "Partial" if @dynamic_template.partial
    fill_in "Path", with: @dynamic_template.path
    click_on "Create Dynamic template"

    assert_text "Dynamic template was successfully created"
    click_on "Back"
  end

  test "should update Dynamic template" do
    visit dynamic_template_url(@dynamic_template)
    click_on "Edit this dynamic template", match: :first

    fill_in "Body", with: @dynamic_template.body
    fill_in "Format", with: @dynamic_template.format
    fill_in "Handler", with: @dynamic_template.handler
    fill_in "Locale", with: @dynamic_template.locale
    check "Partial" if @dynamic_template.partial
    fill_in "Path", with: @dynamic_template.path
    click_on "Update Dynamic template"

    assert_text "Dynamic template was successfully updated"
    click_on "Back"
  end

  test "should destroy Dynamic template" do
    visit dynamic_template_url(@dynamic_template)
    click_on "Destroy this dynamic template", match: :first

    assert_text "Dynamic template was successfully destroyed"
  end
end
