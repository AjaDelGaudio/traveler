require "rails_helper"

feature "user searches adventures", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to quickly find an adventure
  So that I can make plans with haste.
) do
  # Acceptance Criteria
  # [ ] I must be signed in to find my private adventures
  # [ ] I can find any public adventure shared by other users or myself
  # [ ] I can find adventures by browsing a list of public adventures
  # [ ] If there are no relevant adventures, I am informed
  # [ ] I can find adventures by typing key words in a search bar
  # [ ] Using the search bar will return a list of relevant adventures

  scenario "authenticated user sucessfully searches for their own adventure " \
  "by name" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: user.id,
      name: "Walk on the moon",
      is_shared: true
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list.id
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: user.id,
      name: "Taste moon cheese",
      is_shared: false
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list.id
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: user.id,
      name: "Swim with sharks"
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "moon"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(adventure_2.name)
    expect(page).not_to have_content(adventure_3.name)
  end

  scenario "authenticated user sucessfully searches for their own adventure " \
  "by address" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: user.id,
      address: "White Rabbit, Beijing, China",
      is_shared: true
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list.id
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: user.id,
      address: "Temple Bar, Beijing, China",
      is_shared: false
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list.id
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: user.id,
      address: "FUBAR, Urumqi, China"
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "beijing china"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(adventure_2.name)
    expect(page).not_to have_content(adventure_3.name)
  end

  scenario "authenticated user sucessfully searches for their own adventure " \
  "by notes" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: user.id,
      notes: "Get lessons first.",
      is_shared: true
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list.id
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: user.id,
      address: "First bake egg.",
      is_shared: false
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list.id
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: user.id,
      address: "Avoid purple."
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "first"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(adventure_2.name)
    expect(page).not_to have_content(adventure_3.name)
  end

  scenario "authenticated user sucessfully searches for their own adventure " \
  "by bucket list" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    bucket_list_1 = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Mexico"
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: user.id,
      is_shared: true
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list_1.id
    )

    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Mexico City"
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: user.id,
      is_shared: false
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list_2.id
    )

    bucket_list_3 = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Guatamala"
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: user.id
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list_3.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "first"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(adventure_2.name)
    expect(page).not_to have_content(adventure_3.name)
  end

  scenario "authenticated user sucessfully searches adventures and discovers " \
  "other user's shared adventure" do
    current_user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    sign_in(current_user)

    bucket_list_1 = FactoryGirl.create(
      :bucket_list,
      user_id: current_user.id,
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: current_user.id,
      is_shared: true
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list_1.id
    )

    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      user_id: other_user.id,
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: other_user.id,
      is_shared: true
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list_2.id
    )

    bucket_list_3 = FactoryGirl.create(
      :bucket_list,
      user_id: other_user.id
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: other_user.id,
      is_shared: false
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list_3.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "first"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(adventure_2.name)
    expect(page).not_to have_content(adventure_3.name)
  end

  scenario "unathenticated user sucessfully searches adventures and finds " \
  "other user's shared adventure and his/her own " do
    unauthenticated_user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)

    bucket_list_1 = FactoryGirl.create(
      :bucket_list,
      user_id: unauthenticated_user.id,
    )
    adventure_1 = FactoryGirl.create(:adventure,
      user_id: unauthenticated_user.id,
      is_shared: true,
      address: "Mongolia"
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_1.id,
      bucket_list_id: bucket_list_1.id
    )

    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      user_id: unauthenticated_user.id,
    )
    adventure_2 = FactoryGirl.create(:adventure,
      user_id: unauthenticated_user.id,
      is_shared: false,
      address: "Mongolia"
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_2.id,
      bucket_list_id: bucket_list_2.id
    )

    bucket_list_3 = FactoryGirl.create(
      :bucket_list,
      user_id: other_user.id
    )
    adventure_3 = FactoryGirl.create(:adventure,
      user_id: other_user.id,
      is_shared: true,
      address: "Mongolia"
    )
    bucket_list_adventure_3 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_3.id,
      bucket_list_id: bucket_list_3.id
    )

    bucket_list_4 = FactoryGirl.create(
      :bucket_list,
      user_id: other_user.id
    )
    adventure_4 = FactoryGirl.create(:adventure,
      user_id: other_user.id,
      is_shared: false,
      address: "Mongolia"
    )
    bucket_list_adventure_4 = FactoryGirl.create(
      :bucket_list_adventure,
      adventure_id: adventure_4.id,
      bucket_list_id: bucket_list_4.id
    )

    visit bucket_lists_path
    fill_in "input#q.adventures-search-bar", with: "first"
    click_button "Find Adventure!"

    expect(page).to have_content(adventure_1.name)
    expect(page).not_to have_content(adventure_2.name)
    expect(page).to have_content(adventure_3.name)
    expect(page).not_to have_content(adventure_4.name)
  end
end
