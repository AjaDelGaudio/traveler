require "rails_helper"

feature 'authenticated user edits a bucket list', %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to edit a bucket list
  So I can later recall the destinations without weighing down my bag or mind.
) do
# Acceptance Criteria
# [x] I can change the title and description
# [x] I must click submit to save my changes
# [x] I can toggle between private and public


  scenario "user successfully changes the title of a bucket list" do
    bucket_list_sign_in
    visit bucket_lists_path
    click_link 'Edit'
    fill_in 'Title', with: 'Africa'
    fill_in 'Description', with: 'Much warmer!'
    click_button 'Save changes'

    expect(page).to have_content("Changes saved!")
    expect(page).to have_content("My Bucket Lists")
  end

  scenario "user fails to successfully edit a bucket list" do
    bucket_list_sign_in
    visit bucket_lists_path
    click_link 'Edit'
    fill_in 'Title', with: ''
    click_button 'Save changes'

    expect(page).not_to have_content("Changes saved!")
    expect(page).to have_content("Every list needs a title.")
  end
end
