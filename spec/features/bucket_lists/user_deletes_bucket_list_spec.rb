require "rails_helper"

feature "authenticated user deletes a bucket list", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to delete a bucket list
  So I can throw away my dreams.
) do
# Acceptance Criteria
# [x] I can click a link to delete a bucket list
# [x] I receive an success message after deleting a bucket list
# [x] After I delete a bucket list it is no longer visible

  scenario "authenticated user sucessfully deletes a bucket list" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)
    visit edit_bucket_list_path(bucket_list.id)
    click_link "Delete"

    expect(page).to have_content("Bucket List deleted")
    expect(page).not_to have_content(bucket_list.title)
  end

  scenario "unauthenticated user fails to delete a bucket list" do
    visit bucket_lists_path

    expect(page).to have_content("Log in")
    expect(page).not_to have_content("Delete")
  end
end
