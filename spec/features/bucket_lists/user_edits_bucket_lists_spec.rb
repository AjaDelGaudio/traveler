require "rails_helper"

feature 'authenticated user creates a bucket list', %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to edit a bucket list
  So I can later recall the destinations without weighing down my bag or mind.
) do
# Acceptance Criteria
#[x] I can change the title and description
#[x] I must click submit to save my changes
#[x] I can toggle between private and public


  scenario "user successfully changes the title of a bucket list" do
    visit new_user_session_path
    sign_in
    visit root_path
    click_link 'New Bucket List!'
    fill_in 'Title', with: 'Europe'
    click_button 'Create Your Bucket List!'

    expect(page).to have_content("Congrats! You started a new Bucket List!")
    expect(page).to have_content('Europe')
  end
end
