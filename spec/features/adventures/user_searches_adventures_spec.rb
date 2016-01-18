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

  scenario "authenticated user sucessfully searches for an adventure by name" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
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

end
