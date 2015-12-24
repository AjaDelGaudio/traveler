require "rails_helper"

feature "user views an of their adventures", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to view my adventures
  So that I can explore adventures on the fly.
) do
  # Acceptance Criteria
  # [] I must be signed in to view my private adventures
  # [] If my adventure includes a link and I click it, I am taken to the link
  #    address
  # [] I can view a list of the adventures associated with each bucket_list
  # [] I can see an icon telling me if my adventure is public or private
  # [] I can click an icon link to switch any on my adventures between public
  #    and private
  # [] I can click a link to edit my adventure

  scenario "authenticated user successfully views a list of their adventures " \
  "associated with each of their bucket lists by navigating to their bucket" \
  " list index page" do
    user = FactoryGirl.create(:user)

    # bucket_list_1
    bucket_list_1 = FactoryGirl.create(:bucket_list, user_id: user.id)
    adventure_1 = FactoryGirl.create(
      :adventure
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list_1.id,
      adventure_id: adventure_1.id
    )

    # bucket_list_2
    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      title: "Mongolia"
    )
    adventure_2 = FactoryGirl.create(
      :adventure,
      name: "Sleep in a yurt"
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list_2.id,
      adventure_id: adventure_2.id
    )

    sign_in_with_adventures
    visit bucket_lists_path

    expect(page).to have_content("Second Bucket List")
    expect(page).to have_content("Go pearl diving")
    expect(page).to have_content("Second Bucket List")
    expect(page).to have_content("Paint something")
  end

  scenario "unauthenticated user fails to view a list of their adventures " \
  "associated with each of their bucket lists" do

  end

  scenario "authenticated user successfully clicks on an adventure link and " \
  "navigates to the associated address" do

  end

  scenario "authenticated user successfully switches an adventure from public" \
  " to private by clicking on the appropirate icon" do

  end

  scenario "authenticated user successfully navigates to the edit page for " \
  " one of their adventures by clicking on the appropriate link" do

  end
end
