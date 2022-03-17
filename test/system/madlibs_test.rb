require "application_system_test_case"

class MadlibsTest < ApplicationSystemTestCase
  setup do
    @madlib = madlibs(:one)
  end

  test "visiting the index" do
    visit madlibs_url
    assert_selector "h1", text: "Madlibs"
  end

  test "should create madlib" do
    visit madlibs_url
    click_on "New madlib"

    fill_in "Name", with: @madlib.name
    fill_in "Template", with: @madlib.template
    click_on "Create Madlib"

    assert_text "Madlib was successfully created"
    click_on "Back"
  end

  test "should update Madlib" do
    visit madlib_url(@madlib)
    click_on "Edit this madlib", match: :first

    fill_in "Name", with: @madlib.name
    fill_in "Template", with: @madlib.template
    click_on "Update Madlib"

    assert_text "Madlib was successfully updated"
    click_on "Back"
  end

  test "should destroy Madlib" do
    visit madlib_url(@madlib)
    click_on "Destroy this madlib", match: :first

    assert_text "Madlib was successfully destroyed"
  end
end
