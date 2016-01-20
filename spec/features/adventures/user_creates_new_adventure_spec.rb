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
  # [x] I may include text notes about the adventure
  # [x] I may mark the adventure as achieved if I choose
  # [x] By defalut, the adventure is marked as not achieved
  # [x] I can select the bucket list I would like to add my adventure to from
  #    a dropdown list
  # [] I may include a link by submitting the address
  # [x] I recieve a success message when I successfully add an adventure

  scenario "authenticated user successfully creates an adventure" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)

    visit new_adventure_path
    fill_in "Adventure address:", with: "Egypt"
    click_button "Toss it in!"

    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "authenticated user successfully creates an adventure w/ " \
    "unrequired attributes" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)

    visit new_adventure_path
    fill_in "Adventure address:", with: "Swim the Nile"
    fill_in "Notes:", with: "Avoid crocodiles, wear sunscreen"
    fill_in "Link:", with: "http://wikitravel.org/en/Jinja"
    checkbox_achieved = find_by_id("adventure_is_achieved")
    check "Seen it! Done it!"
    checkbox_shared = find_by_id("adventure_is_shared")
    check "Share it!"
    click_button "Toss it in!"

    expect(checkbox_achieved).to be_checked
    expect(checkbox_shared).to be_checked
    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "authenticated user successfully creates adventure and selects a " \
  "bucket list" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)

    visit new_adventure_path
    fill_in "Adventure address:", with: "Egypt"
    select bucket_list.title, from: "Add to group:"
    click_button "Toss it in!"

    expect(page).to have_content(bucket_list.title)
    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "authenticated user successfully creates an adventure w/ " \
    "link attribute" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)

    visit new_adventure_path
    fill_in "Adventure address:", with: "Underground River"
    fill_in "Link:", with: "https://en.wikipedia.org/wiki/Puerto_Princesa_Subterranean_River_National_Park"
    checkbox_achieved = find_by_id("adventure_is_achieved")
    check "Seen it! Done it!"
    checkbox_shared = find_by_id("adventure_is_shared")
    check "Share it!"
    click_button "Toss it in!"

    expect(checkbox_achieved).to be_checked
    expect(checkbox_shared).to be_checked
    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Address can't be blank")
  end

  scenario "unauthenticated user fails to create a new adventure" do
    visit new_adventure_path

    expect(page).to have_content("You can do that after you sign in or sign up!")
    expect(page).to have_content("Log in")
    expect(page).not_to have_content("Adventure address:")
    expect(page).not_to have_content("New Adventure")
  end

  scenario "authenticated user fails to create an adventure due to " \
    "no bucket_lists (0 count)" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_adventure_path

    expect(page).to have_content("You don't have any bucket lists yet")
    expect(page).to have_content("Group title:")
    expect(page).to have_content("Description:")
    expect(page).not_to have_content("Adventure address:")
    expect(page).not_to have_content("Link")
    expect(page).not_to have_content("Excellent! Another adventure awaits!")
  end
end
