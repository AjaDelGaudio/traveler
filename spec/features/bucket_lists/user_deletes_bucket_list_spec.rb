require "rails_helper"

feature 'authenticated user deletes a bucket list', %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to delete a bucket list
  So I can throw away my dreams.
) do
# Acceptance Criteria
# [x] I can click a link to delete a bucket list
# [x] I receive an success message after deleting a bucket list
# [x] After I delete a bucket list it is no longer visible
  # 
  # scenario "authenticated user sucessfully deletes a bucket list" do
  #   bucket_list = FactoryGirl.create(:bucket_list)
  #
  #   visit new_user_session_path
  #   fill_in 'Email', with: bucket_list.user.email
  #   fill_in 'Password', with: bucket_list.user.password
  #   click_button 'Log in'
  #   visit edit_bucket_list_path(bucket_list)
  #   click_link 'Delete'
  #
  #   expect(page).to have_content("Bucket List deleted")
  #   expect(page).not_to have_content(bucket_list.title)
  # end
end
