require "application_system_test_case"

class UsercommentratingsTest < ApplicationSystemTestCase
  setup do
    @usercommentrating = usercommentratings(:one)
  end

  test "visiting the index" do
    visit usercommentratings_url
    assert_selector "h1", text: "Usercommentratings"
  end

  test "should create usercommentrating" do
    visit usercommentratings_url
    click_on "New usercommentrating"

    fill_in "Comment", with: @usercommentrating.comment_id
    fill_in "Rating", with: @usercommentrating.rating
    fill_in "User", with: @usercommentrating.user_id
    click_on "Create Usercommentrating"

    assert_text "Usercommentrating was successfully created"
    click_on "Back"
  end

  test "should update Usercommentrating" do
    visit usercommentrating_url(@usercommentrating)
    click_on "Edit this usercommentrating", match: :first

    fill_in "Comment", with: @usercommentrating.comment_id
    fill_in "Rating", with: @usercommentrating.rating
    fill_in "User", with: @usercommentrating.user_id
    click_on "Update Usercommentrating"

    assert_text "Usercommentrating was successfully updated"
    click_on "Back"
  end

  test "should destroy Usercommentrating" do
    visit usercommentrating_url(@usercommentrating)
    click_on "Destroy this usercommentrating", match: :first

    assert_text "Usercommentrating was successfully destroyed"
  end
end
