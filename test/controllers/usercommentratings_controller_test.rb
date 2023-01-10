require "test_helper"

class UsercommentratingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usercommentrating = usercommentratings(:one)
  end

  test "should get index" do
    get usercommentratings_url
    assert_response :success
  end

  test "should get new" do
    get new_usercommentrating_url
    assert_response :success
  end

  test "should create usercommentrating" do
    assert_difference("Usercommentrating.count") do
      post usercommentratings_url, params: { usercommentrating: { comment_id: @usercommentrating.comment_id, rating: @usercommentrating.rating, user_id: @usercommentrating.user_id } }
    end

    assert_redirected_to usercommentrating_url(Usercommentrating.last)
  end

  test "should show usercommentrating" do
    get usercommentrating_url(@usercommentrating)
    assert_response :success
  end

  test "should get edit" do
    get edit_usercommentrating_url(@usercommentrating)
    assert_response :success
  end

  test "should update usercommentrating" do
    patch usercommentrating_url(@usercommentrating), params: { usercommentrating: { comment_id: @usercommentrating.comment_id, rating: @usercommentrating.rating, user_id: @usercommentrating.user_id } }
    assert_redirected_to usercommentrating_url(@usercommentrating)
  end

  test "should destroy usercommentrating" do
    assert_difference("Usercommentrating.count", -1) do
      delete usercommentrating_url(@usercommentrating)
    end

    assert_redirected_to usercommentratings_url
  end
end
