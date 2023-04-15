require "test_helper"

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get basket_new_url
    assert_response :success
  end

  test "should get edit" do
    get basket_edit_url
    assert_response :success
  end

  test "should get show" do
    get basket_show_url
    assert_response :success
  end

  test "should get update" do
    get basket_update_url
    assert_response :success
  end

  test "should get destroy" do
    get basket_destroy_url
    assert_response :success
  end

  test "should get create" do
    get basket_create_url
    assert_response :success
  end
end
