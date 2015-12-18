require "rails_helper"

feature "authenticated user creates a an adventure using google maps", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to create an adventure
  So I can add it to any of my bucket lists.
) do
# Acceptance Criteria
# [] If the adventure is a location, I may create the adventure using
#    google maps
# [] The serach box will autocomplete as I type
# [] The search box will show the adventure location on a map
# [] I recieve a success message when I successfully add an adventure

  # scenario "authenticated user successfully adds an adventure with title only" do
  #   bucket_list = FactoryGirl.create(:bucket_list)
  #
  #   visit new_user_session_path
  #   fill_in 'Email', with: bucket_list.user.email
  #   fill_in 'Password', with: bucket_list.user.password
  #   click_button 'Log in'
  #   visit root_path
  #   fill_in 'Name', with: "eat dragon fruit"
  #   select bucket_list.title, from: 'Bucket list'
  #   click_button 'Add to Bucket List!'
  #
  #   expect(page).to have_content("Excellent!  Another adventure to happen!")
  #   expect(page).to have_content("Name")
  #   expect(page).to have_content("Address")
  # end
  #
  # scenario "unauthenticated user fails to add an adventure to a bucket list" do
  #   visit root_path
  #
  #   expect(page).to have_content("You can do that after you sign in or " +
  #   "sign up!")
  #   expect(page).to have_content("Email")
  #   expect(page).to have_content("Password")
  # end
  #
  # scenario "authenticated user fails to add an adventure to a " +
  #   "bucket list" do
  #   bucket_list_sign_in
  #   visit root_path
  #   click_button 'Add to Bucket List!'
  #
  #   expect(page).to have_content("Name can't be blank")
  #   expect(page).to have_content("Address can't be blank")
  # end
  #
  # scenario "authenticated user successfully adds an adventure to an " +
  #   "existing bucket list with address only" do
  #   bucket_list = FactoryGirl.create(:bucket_list)
  #
  #   visit new_user_session_path
  #   fill_in 'Email', with: bucket_list.user.email
  #   fill_in 'Password', with: bucket_list.user.password
  #   click_button 'Log in'
  #   visit root_path
  #   fill_in 'Address', with: "Paris, France"
  #   select bucket_list.title, from: 'Bucket list'
  #   click_button 'Add to Bucket List!'
  #
  #   expect(page).to have_content("Excellent!  Another adventure to happen!")
  #   expect(page).to have_content("I've already been here/done this")
  # end
end
