require "rails_helper"

feature "user views their adventures", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to view my adventures
  So that I can explore adventures on the fly.
) do
  # Acceptance Criteria
  # [] I must be signed in to view my private adventures
  # [] If my adventure includes a link and I click it, I am taken to the link
  #    address
  # [x] I can view a list of the adventures associated with each bucket_list
  # [x] I can see an icon telling me if my adventure is public or private
  # [x] I can click a link to edit my adventure

  scenario "authenticated user successfully views list of their adventures " \
  "associated w/ a particular bucket lists by navigating to that bucket" \
  " list's show page" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    # bucket_list_1
    bucket_list_1 = FactoryGirl.create(:bucket_list, user_id: user.id)
    adventure_1 = FactoryGirl.create(
      :adventure,
      user_id: user.id
    )
    bucket_list_adventure_1 = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list_1.id,
      adventure_id: adventure_1.id
    )

    # bucket_list_2
    bucket_list_2 = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      title: "Mongolia"
    )
    adventure_2 = FactoryGirl.create(
      :adventure,
      user_id: user.id,
      name: "Sleep in a yurt"
    )
    bucket_list_adventure_2 = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list_2.id,
      adventure_id: adventure_2.id
    )

    visit bucket_list_path(bucket_list_1.id)

    expect(page).to have_content(bucket_list_1.title)
    expect(page).to have_content(adventure_1.name)
    expect(page).not_to have_content(bucket_list_2.title)
    expect(page).not_to have_content(adventure_2.name)
  end

  scenario "unauthenticated user fails to view a list of their adventures " \
  "associated with each of their bucket lists" do
    user = FactoryGirl.create(:user)

    bucket_list = FactoryGirl.create(
      :bucket_list,
      user_id: user.id,
      is_public: false
    )
    adventure = FactoryGirl.create(
      :adventure
    )
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list.id,
      adventure_id: adventure.id
    )

    visit root_path
    click_link "My Bucket Lists"

    expect(page).to have_content("You can do that after you sign in or sign up!")
    expect(page).to have_content("Log in")
    expect(page).not_to have_content(bucket_list.title)
    expect(page).not_to have_content(adventure.name)
  end

  scenario "authenticated user successfully views list of their adventures" \
  " by navigating to the adventures index page" do
  end

  scenario "unauthenticated user fails to view list of their adventures" \
  " by navigating to the adventures index page" do
  end

  scenario "unauthenticated user successfully views list of public adventures" \
  " by navigating to the all_public adventures page" do
    # # bucket_list_1
    # bucket_list_1 = FactoryGirl.create(:bucket_list, user_id: 1)
    # adventure_1 = FactoryGirl.create(
    #   :adventure,
    #   user_id: 1,
    #   is_shared: true
    # )
    # bucket_list_adventure_1 = FactoryGirl.create(
    #   :bucket_list_adventure,
    #   bucket_list_id: bucket_list_1.id,
    #   adventure_id: adventure_1.id
    # )
    #
    # # bucket_list_2
    # bucket_list_2 = FactoryGirl.create(
    #   :bucket_list,
    #   user_id: 2,
    #   title: "Mongolia",
    #   is_shared: false
    # )
    # adventure_2 = FactoryGirl.create(
    #   :adventure,
    #   user_id: user.id,
    #   name: "Sleep in a yurt"
    # )
    # bucket_list_adventure_2 = FactoryGirl.create(
    #   :bucket_list_adventure,
    #   bucket_list_id: bucket_list_2.id,
    #   adventure_id: adventure_2.id
    # )
    #
    # visit bucket_list_path(bucket_list_1.id)
    #
    # expect(page).to have_content(bucket_list_1.title)
    # expect(page).to have_content(adventure_1.name)
    # expect(page).not_to have_content(bucket_list_2.title)
    # expect(page).not_to have_content(adventure_2.name)
  end


  scenario "authenticated user successfully clicks on an adventure link and " \
  "navigates to the associated address" do
  # TEST MANUALLY: deactivated b/c test only works for internal links
  #   user = FactoryGirl.create(:user)
  #   visit new_user_session_path
  #   fill_in "Email", with: user.email
  #   fill_in "Password", with: user.password
  #   click_button "Log in"
  #
  #   bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
  #   adventure = FactoryGirl.create(
  #     :adventure,
  #     user_id: user.id
  #   )
  #   bucket_list_adventure = FactoryGirl.create(
  #     :bucket_list_adventure,
  #     bucket_list_id: bucket_list.id,
  #     adventure_id: adventure.id
  #   )
  #
  #   visit adventure_path(adventure.id)
  #
  #   expect(page).to have_selector(:css, 'a[href="www.google.com"]')
  #   expect(page).to have_content(bucket_list.title)
  #   expect(page).to have_content(adventure.name)
  #   expect(page).to have_content(adventure.link)
  #
  #   click_link adventure.link
  #
  #   expect(page).not_to have_content(bucket_list.title)
  #   expect(page).not_to have_content(adventure.name)
  end

  scenario "unauthenticated user fails to view a list of their adventures " \
  "associated with each of their bucket lists" do

  end

  scenario "authenticated user successfully switches an adventure from public" \
  " to private by clicking on the appropirate icon" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
    adventure = FactoryGirl.create(
      :adventure,
      is_shared: true
    )
    bucket_list_adventure = FactoryGirl.create(
      :bucket_list_adventure,
      bucket_list_id: bucket_list.id,
      adventure_id: adventure.id,
    )

    visit bucket_list_path(bucket_list.id)
    click_link "edit adventure"
    checkbox_shared = find_by_id("adventure_is_shared")
    check "Share it!"
    click_button "Save It!"

    expect(checkbox_shared).to be_checked
    expect(page).to have_content("Changes saved!")
    expect(page).not_to have_content("Must specify a name and/or address")
  end

  scenario "authenticated user successfully navigates to the edit page for " \
  " one of their adventures by clicking on the appropriate link" do

  end
end
