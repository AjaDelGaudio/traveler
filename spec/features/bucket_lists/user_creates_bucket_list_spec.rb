require "rails_helper"

feature 'authenticated user creates a bucket list', %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to create a bucket list
  So I can later recall the destinations without weighing down my bag or mind.
) do
# Acceptance Criteria
# [x] I can create a new list from the index page
# [x] I must provide a title
# [x] If I do not provide a title, I cannot save it and recieve an error message
# [x] By default, a list is private
# [x] I may choose to make a list public
# [x] I must click a button to create the list
# [x] I recieve a success message when I successfully create a list
# [x] I must be signed in to create the list

  scenario "authenticated user successfully creates a bucket list" do
    visit new_user_session_path
    sign_in
    visit root_path
    click_link 'New Bucket List!'
    fill_in 'Title', with: 'Europe'
    click_button 'Create Your Bucket List!'

    expect(page).to have_content("Congrats! You started a new Bucket List!")
    expect(page).to have_content('Europe')
  end

  scenario "unauthenticated user creates a bucket list" do
    visit root_path
    click_link 'New Bucket List'
    fill_in 'Title', with: 'Europe'
    click_button 'Create Your Bucket List!'

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end


    scenario "authenticated user fails to sucessfully create a bucket list" do
      visit new_user_session_path
      sign_in
      visit root_path
      click_link 'New Bucket List'
      fill_in 'Description', with: 'Europe'
      click_button 'Create Your Bucket List!'

      expect(page).to have_content("Title can't be blank")
      expect(page).not_to have_content("Congrats! You started a new Bucket List!")
    end
end
