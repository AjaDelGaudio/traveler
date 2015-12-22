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
    bucket_list_sign_in
    bucket_list_1 = FactoryGirl.create(:bucket_list, user: user)
    adventure_1 = FactoryGirl.create(
      :adventure,
      user: user,
      bucket_list: bucket_list_1
    )
    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      title: "Mongolia",
      user: user
    )
    adventure_2 = FactoryGirl.create(
      :adventure,
      name: "Sleep in a yurt"
      user: user,
      bucket_list: bucket_list_2
    )
    visit bucket_list_path

    expect(page).to have_content(bucket_list_1.title)
    expect(page).to have_content(adventure_1.name)
    expect(page).to have_content(bucket_list_2.title)
    expect(page).to have_content(adventure_2.name)
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
