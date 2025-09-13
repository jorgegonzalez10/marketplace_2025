require "test_helper"

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get Products" do
    get api_v1_Products_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_create_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_edit_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_new_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_delete_url
    assert_response :success
  end
end
