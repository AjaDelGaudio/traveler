# feature "user creates a link", %(
#   As a last minute traveler or traveler who's stay is unexpectedly extended,
#   I want to create a link
#   So I can include it when creating an adventure.
# ) do
#   # Acceptance Criteria
#   # [x] I can add multiple links to an adventure
#   # [x] If I add a link, I must submit a link address
#   # [x] If I add a link, I may also add a link name
#   # [x] I can click a button to add a new link
#
#   scenario "authenticated user successfully adds a link to an adventure",
#   js: true do
#     user = FactoryGirl.create(:user)
#     bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
#     sign_in(user)
#
#     visit new_adventure_path
#     fill_in "Adventure address:", with: "Egypt"
#     click_link "Add link"
#
#     expect(page).to have_content("Link name:")
#     expect(page).to have_content("Link address:")
#
#     fill_in "Link name:", with: "Wikipedia"
#     fill_in "Link address:", with: "www.wikipedia.org"
#
#     expect(page).to have_content("Link successfully added")
#     expect(page).not_to have_content("Link address can't be blank")
#
#     click_button "Save it!"
#
#     expect(page).to have_content("Excellent! Another adventure awaits!")
#     expect(page).not_to have_content("Link address can't be blank")
#     expect(page).not_to have_content("Address can't be blank")
#   end
#
#   scenario "authenticated user fails to add a link to an adventure", js: true do
#     user = FactoryGirl.create(:user)
#     bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
#     sign_in(user)
#
#     visit new_adventure_path
#     fill_in "Adventure address:", with: "Egypt"
#     click_link "Add link"
#
#     click_button "Save it!"
#
#     expect(page).to have_content("Link address can't be blank")
#     expect(page).not_to have_content("Link successfully added")
#   end
#
#   scenario "authenticated user successfully adds multiple links to adventure",
#   js: true do
#     user = FactoryGirl.create(:user)
#     bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
#     sign_in(user)
#
#     visit new_adventure_path
#     fill_in "Adventure address:", with: "Egypt"
#     click_link "Add link"
#
#     fill_in "Link name:", with: "Wikipedia"
#     fill_in "Link address:", with: "www.wikipedia.org"
#     click_link "Add link"
#
#     fill_in "Link name:", with: "Wikitravel"
#     fill_in "Link address:", with: "www.wikitravel.org"
#     click_button "Save it!"
#
#     expect(page).to have_content("Excellent! Another adventure awaits!")
#     expect(page).not_to have_content("Link address can't be blank")
#     expect(page).not_to have_content("Address can't be blank")
#   end
# end
