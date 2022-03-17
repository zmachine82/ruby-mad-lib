require "test_helper"

class MadlibsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @madlib = madlibs(:one)
  end

  test "should get index" do
    get madlibs_url
    assert_response :success
  end

  test "should get new" do
    get new_madlib_url
    assert_response :success
  end

  test "should create madlib" do
    assert_difference("Madlib.count") do
      post madlibs_url, params: { madlib: { name: @madlib.name, template: @madlib.template } }
    end

    assert_redirected_to madlib_url(Madlib.last)
  end

  test "should show madlib" do
    get madlib_url(@madlib)
    assert_response :success
  end

  test "should get edit" do
    get edit_madlib_url(@madlib)
    assert_response :success
  end

  test "should update madlib" do
    patch madlib_url(@madlib), params: { madlib: { name: @madlib.name, template: @madlib.template } }
    assert_redirected_to madlib_url(@madlib)
  end

  test "should destroy madlib" do
    assert_difference("Madlib.count", -1) do
      delete madlib_url(@madlib)
    end

    assert_redirected_to madlibs_url
  end
end
