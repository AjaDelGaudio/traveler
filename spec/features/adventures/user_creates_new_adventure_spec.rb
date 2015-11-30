require "rails_helper"

feature "user creates an adventure", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to create an adventure
  So I can add it to any of my bucket lists.
) do
  # Acceptance Criteria
  # [] I must be signed in to add an adventure
  # [] I must create a bucket list before I can create an adventure
  # [] I must provide a either a name, address, or both
  # [] If I do not provide a name or address, I recieve an error message
  # [] I may include text notes about the adventure
  # [] I may mark the adventure as achieved if I choose
  # [] By defalut, the adventure is marked as not achieved
  # [] I can select the bucket list I would like to add my adventure to from
  #    a dropdown list
  # [] I recieve a success message when I successfully add an adventure

  scenario "authenticated user successfully creates an adventure" do
    bucket_list_sign_in
    visit new_adventure_path
    fill_in "Name", with: "Swim the Nile"
    click_button "Toss it in!"

    expect(page).to have_content("Excellent! Another adventure awaits!")
  end

  # scenario "authenticated user does not specify either name or address" do
  #   bucket_list_sign_in
  #   visit new_adventure_path
  #   click_button "Toss it in!"
  #
  #   expect(page).not_to have_content("Excellent! Another adventure awaits!")
  # end
end
