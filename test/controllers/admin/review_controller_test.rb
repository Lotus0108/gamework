require "test_helper"

class Admin::ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_review_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_review_destroy_url
    assert_response :success
  end
end
