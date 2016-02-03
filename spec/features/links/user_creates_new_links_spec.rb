feature "user creates a link", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to add a link
  So I can add it while creating an adventure.
) do
  # Acceptance Criteria
  # [] I can add multiple links to an adventure
  # [] If I add a link, I must submit a link address
  # [] If I add a link, I may also add a link name
  # [] I can click a button to add a new link

  scenario "authenticated user successfully adds a link to an adventure" do
    user = FactoryGirl.create(:user)
    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    sign_in(user)

    visit new_adventure_path
    fill_in "Adventure address:", with: "Egypt"
    click_button "Add link"

    fill_in "Link name:", with: "Wikipedia"
    fill_in "Link address:", with "www.wikipedia.org"
    click_button "Save link"

    expect(page).to have_content("Link successfully added")
    expect(page).not_to have_content("Link address can't be blank")

    click_button "Save it!"

    expect(page).to have_content("Excellent! Another adventure awaits!")
    expect(page).not_to have_content("Link address can't be blank")
    expect(page).not_to have_content("Address can't be blank")
  end
end
