require "rails_helper"

feature 'authenticated user creates a an adventure using google maps', %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to create an adventure
  So I can add it to any of my bucket lists.
) do
# Acceptance Criteria
# [] I must be signed in to add an adventure to any of my bucket lists
# [] I can create a new adventure from the index page
# [] I must provide a either a name, address, or both
# [] If I do not provide a name or address, I recieve an error message
# [] I may include text notes about the adventure
# [] I may mark the adventure as achieved if I choose
# [] By defalut, the adventure is marked as not achieved
# [] If the adventure is a location, I may create the adventure using
#    google maps
# [] The serach box will autocomplete as I type
# [] The search box will show the adventure location on a map
# [] If my adventure is not tied to a location (ex: action, event), I can
#    fill out a field to submit the custom adventure
# [] I can select the bucket list I would like to add my adventure to from
#    a dropdown list
# [] I must click a link to add the location to any bucket list
# [] I recieve a success message when I successfully add an adventure

  scenario "authenticated user successfully adds an adventure" do
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    fill_in 'Email', with: bucket_list.user.email
    fill_in 'Password', with: bucket_list.user.password
    click_button 'Log in'
    visit root_path
    fill_in 'Name', with: "eat dragon fruit"
    select bucket_list.title, from: 'Bucket list'
    click_button 'Add to Bucket List!'

    expect(page).to have_content("Excellent!  Another adventure to happen!")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
  end

  scenario "unauthenticated user fails to add an adventure to a bucket list" do
    visit root_path
    fill_in 'Name', with: "eat dragon fruit"
    click_link 'Add to Bucket List!'
    expect(page).to have_content("You can do that after you sign in or" +
    "sign up!")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "authenticated user fails to add an adventure to a" +
    "bucket list" do
    sign_in
    visit root_path
    click_link 'Add to Bucket List!'

    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Add to your Bucket List!")
  end

  scenario "authenticated user successfully adds an adventure to an" +
    "existing bucket list using gooogle maps" do
    bucket_list = FactoryGirl.create(:bucket_list)

    sign_in
    visit root_path
    fill_in 'Latitude', with: "13.44574199"
    fill_in 'Longitude', with: "222.83143576"
    select bucket_list.title, from: 'Bucket List'
    click_link 'Add to Bucket List!'

    expect(page).to have_content("Excellent!  Another adventure to happen!")
    expect(page).to have_content("Add to Bucket List!")
  end



  scenario "authenticated user successfully adds an adventure to a " +
    "new bucket list using gooogle maps" do
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    sign_in
    visit root_path
    fill_in 'Latitude', with: "13.44574199"
    fill_in 'Longitude', with: "222.83143576"
    select 'Create new Bucket List', from: 'Bucket List'
    fill_in 'Title', with: 'My Bucket List'
    click_link 'Add to Bucket List!'

    expect(page).to have_content("Congrats! You started a new Bucket List!")
    expect(page).to have_content("Excellent!  Another adventure to happen!")
    expect(page).to have_content("Add to Bucket List!")
  end
end
