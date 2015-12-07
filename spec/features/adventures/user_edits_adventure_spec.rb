require "rails_helper"

feature "user edits adventure", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to edit an adventure
  So I can make changes on the fly.
) do
  # Acceptance Criteria
  # [x] I must be signed in to edit an adventure
  # [x] I must provide a either a name, address, or both
  # [x] If my edits do not provide a name or address, I recieve an error message
  # [x] I may edit to include or delete text notes about the adventure
  # [x] I may edit to mark the adventure as achieved or not if I choose
  # [x] I can change the bucket list I would like my adventure associated with
  #    by selecting from a dropdown list
  # [x] I recieve a success message when I successfully edit an adventure

  scenario "authenticated user successfully edits an adventure" do
    bucket_list_sign_in
    adventure = FactoryGirl.create(:adventure)

    visit edit_adventure_path(adventure)
    fill_in "Name", with: "feed fish while snorkeling"
    fill_in "Address", with: "Fiji"
    click_button "Save It!"

    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end

  scenario "authenticated user successfully edits an adventure's bucket list " \
  "bucket_list_adventure attributes" do
    bucket_list_sign_in
    adventure = FactoryGirl.create(:adventure)
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure.id
    )

    visit edit_adventure_path(adventure)
    fill_in "Notes", with: "Avoid crocodiles, wear sunscreen"
    checkbox = find_by_id("adventure_bucket_list_adventures_attributes_0_is_achieved")
    check "Seen it! Done it!"
    click_button "Save It!"

    expect(checkbox).to be_checked
    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end


end
