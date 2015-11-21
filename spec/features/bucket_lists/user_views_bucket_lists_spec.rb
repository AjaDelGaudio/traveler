require "rails_helper"

feature "authenticated user views their bucket lists", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to view a list of travel bucket lists
  So I can quickly recall the bucket list on the go without weighing down my bag or mind.
) do
# Acceptance Criteria
# [x] I can navigate to a list of my bucket lists from the page
# [x] I can see the title, description, and public/saved setting of the bucket
#     list
# [x] The full list is displayed on its own show page
# [x] The page displaying my bucket lists also displays my total number of bucket
#     lists

  scenario "authenticated user views their bucket lists" do
    user = FactoryGirl.create(:user)
    BucketList.create(
      title: "Bucket List Number 1",
      is_public: false,
      user_id: user.id
    )
    BucketList.create(
      title: "Bucket List Number 2",
      is_public: false,
      user_id: user.id
    )
    bucket_list_1_title = user.bucket_lists[0].title
    bucket_list_2_title = user.bucket_lists[1].title

    sign_in
    visit bucket_lists_path

save_and_open_page
    expect(page).to have_content(bucket_list_1_title)
    expect(page).to have_content(bucket_list_2_title)
  end

  scenario "unauthenticated user views their bucket lists" do
    visit bucket_lists_path

    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "authenticated user navigates from the front page to see a list of
    their bucket lists" do
    bucket_list = FactoryGirl.create(:bucket_list)

    sign_in
    visit root_path
    click_link "My Bucket Lists"

    expect(page).to have_content(bucket_list.title)
  end

  scenario "authenticated user views the details of a particular bucket list" do
    bucket_list = FactoryGirl.create(:bucket_list)
    bucket_list_2 = BucketList.create(
      title: "Bucket List Number 2",
      is_public: false
    )

    sign_in
    visit bucket_lists_path
    click_link(bucket_list.title)

    expect(page).to have_content(bucket_list.title)
    expect(page).not_to have_content(bucket_list_2.title)
  end
end
