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
    user = FactoryGirl.create(:user)
    sign_in(user)
    adventure = FactoryGirl.create(:adventure, user_id: user.id)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure.id,
      bucket_list_id: bucket_list.id,
    )

    visit edit_adventure_path(adventure)
    fill_in "Adventure name:", with: "feed fish while snorkeling"
    fill_in "Adventure address:", with: "Fiji"
    fill_in "Notes", with: "Avoid crocodiles, wear sunscreen"
    checkbox_achieved = find_by_id("adventure_is_achieved")
    check "Seen it! Done it!"
    checkbox_shared = find_by_id("adventure_is_shared")
    check "Share it!"
    click_button "Save It!"

    expect(checkbox_achieved).to be_checked
    expect(checkbox_shared).to be_checked
    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "authenticated user successfully edits an adventure's bucket list" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    adventure = FactoryGirl.create(:adventure, user_id: user.id)
    bucket_list_1 = FactoryGirl.create(:bucket_list, user_id: user.id)
    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Second Bucket List"
    )
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure.id,
      bucket_list_id: bucket_list_1.id
    )

    visit edit_adventure_path(adventure)
    select "Second Bucket List", from: "Add to group:"
    click_button "Save It!"

    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "authenticated user successfully adds a name to an adventure" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Second Bucket List"
    )
    adventure = FactoryGirl.create(:adventure, name: nil, user_id: user.id)
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure.id,
      bucket_list_id: bucket_list.id
    )

    visit edit_adventure_path(adventure)
    fill_in "Adventure address:", with: "Do this thing!"
    click_button "Save It!"

    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "unauthenticated user fails to edit an adventure" do
    adventure = FactoryGirl.create(:adventure)

    visit edit_adventure_path(adventure)

    expect(page).to have_content("You can do that after you sign in or sign up!")
    expect(page).not_to have_content("Address can't be blank")
    expect(page).not_to have_content("Changes saved!")
  end

  scenario "authenticated user successfully removes adventure name attribute" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Second Bucket List"
    )
    adventure = FactoryGirl.create(:adventure, user_id: user.id)
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure.id,
      bucket_list_id: bucket_list.id
    )

    visit edit_adventure_path(adventure)
    fill_in "Adventure name:", with: ""
    fill_in "Adventure address:", with: "Fiji"
    click_button "Save It!"

    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Address can't be blank")
  end

  # scenario "authenticated user fails to edit an adventure" do
  #   user = FactoryGirl.create(:user)
  #   sign_in(user)
  #   bucket_list = FactoryGirl.create(
  #     :bucket_list,
  #     user_id: user.id
  #   )
  #   adventure = FactoryGirl.create(:adventure, name: nil, user_id: user.id)
  #   bucket_list_adventure = FactoryGirl.create(
  #     :bucket_list_adventure,
  #     adventure_id: adventure.id,
  #     bucket_list_id: bucket_list.id
  #   )
  #
  #   visit edit_adventure_path(adventure)
  #   find(:css, "textarea[id$='adventure_address']").set("")
  #   click_button "Save It!"
  #
  #   expect(page).to have_content("Address can't be blank")
  #   expect(page).not_to have_content("Changes saved!")
  # end
end
