require "rails_helper"

feature "user creates an adventure", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to create an adventure
  So I can add it to any of my bucket lists.
) do
  # Acceptance Criteria
  # [x] I must be signed in to add an adventure
  # [x] I must create a bucket list before I can create an adventure
  # [x] I must provide a either a name, address, or both
  # [x] If I do not provide a name or address, I recieve an error message
  # [] I may include text notes about the adventure
  # [] I may mark the adventure as achieved if I choose
  # [] By defalut, the adventure is marked as not achieved
  # [] I can select the bucket list I would like to add my adventure to from
  #    a dropdown list
  # [x] I recieve a success message when I successfully add an adventure

  scenario "authenticated user successfully creates an adventure" do
    bucket_list_sign_in
    visit new_adventure_path
    fill_in "Name", with: "Swim the Nile"
    click_button "Toss it in!"

    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end

  scenario "authenticated user successfully creates an adventure w/ " \
    "non-required attributes" do
    bucket_list_sign_in
    visit new_adventure_path
    fill_in "Name", with: "Swim the Nile"
    fill_in "Notes", with: "Avoid crocodiles, wear sunscreen"
    check "Seen it! Done it!"
    save_and_open_page
    click_button "Toss it in!"

    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end

  scenario "authenticated user does not specify either name or address" do
    bucket_list_sign_in
    visit new_adventure_path
    click_button "Toss it in!"

    expect(page).to have_content("Must specify a name and/or address")
    expect(page).not_to have_content("Excellent! Another adventure awaits!")
  end

  scenario "unauthenticated user fails to create a new adventure" do
    visit new_adventure_path

    expect(page).to have_content("You can do that after you sign in or sign up!")
    expect(page).to have_content("Sign In")
    expect(page).not_to have_content("Address")
    expect(page).not_to have_content("New Adventure")
  end

  scenario "authenticated user fails to create and adventure due to " \
    "no bucket_lists (0 count)" do
    sign_in
    visit new_adventure_path

    expect(page).to have_content("You don't have any bucket lists yet")
    expect(page).to have_content("Create a Bucket List")
    expect(page).not_to have_content("New Adventure")
    expect(page).not_to have_content("Address")
    expect(page).not_to have_content("Excellent! Another adventure awaits!")
  end
end
