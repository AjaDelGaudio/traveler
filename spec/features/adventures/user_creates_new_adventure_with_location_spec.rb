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
# [x] I recieve a success message when I successfully add an adventure
# [x] If I do not sucessfully save an adventure with location only, I am told why

  scenario "authenticated user successfully adds an adventure to an " +
    "existing bucket list with address only" do
    user = FactoryGirl.create(:user)
    bucket_list_sign_in(user)
    visit new_adventure_path
    fill_in "Location", with: "Paris, France"
    click_button "Toss it in!"

    expect(page).to have_content("Excellent!  Another adventure awaits!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end

  scenario "authenticated user fails to add an adventure to an " +
    "existing bucket list with address only" do
    user = FactoryGirl.create(:user)
    bucket_list_sign_in(user)

    visit new_adventure_path
    fill_in "Name", with: nil
    fill_in "Location", with: nil
    click_button "Toss it in!"

    expect(page).to have_content("Must specify a name and/or address")
    expect(page).not_to have_content("Excellent!  Another adventure awaits!")
  end
end
