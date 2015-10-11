require "rails_helper"

feature "authenticated user views their bucket lists", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to view a list of travel bucket lists
  So I can quickly recall the bucket list on the go without weighing down my bag or mind.
) do
# Acceptance Criteria
# [x] I can navigate to a list of my bucket lists from the page for creating new
#     lists
# [x] I can navigate to a list of my bucket lists from the front page
# [x] I can see the title, description, and public/saved setting of the bucket
#     list
# [x] The full list is displayed on its own show page
# [x] The page displaying my bucket lists also displays my total number of bucket
#     lists

  scenario "authenticated user views all their bucket lists" do
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    fill_in 'Email', with: bucket_list.user.email
    fill_in 'Password', with: bucket_list.user.password
    click_button 'Log in'
    visit bucket_lists_path

    expect(page).to have_content(bucket_list.title)
  end


  scenario "unauthenticated user views all their bucket lists" do
    visit bucket_lists_path

    expect(page).to have_content("You need to sign in or sign up before
      continuing.")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "authenticated user navigates from the front page to see a list of
    all their bucket lists" do
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    fill_in 'Email', with: bucket_list.user.email
    fill_in 'Password', with: bucket_list.user.password
    click_button 'Log in'
    visit root_path
    click_link 'My Bucket Lists'

    expect(page).to have_content(bucket_list.title)
  end


  scenario "authenticated user navigates from the create new bucket list page
    to see a list of all their bucket lists" do
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    fill_in 'Email', with: bucket_list.user.email
    fill_in 'Password', with: bucket_list.user.password
    click_button 'Log in'
    visit new_bucket_list_path
    click_link 'My Bucket Lists'

    expect(page).to have_content(bucket_list.title)
  end
end
