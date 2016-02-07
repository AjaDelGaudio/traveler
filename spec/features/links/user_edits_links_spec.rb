# feature "user edits a link", %(
#   As a last minute traveler or traveler who's stay is unexpectedly extended,
#   I want to edit a link
#   So I can make changes any time.
# ) do
#   # Acceptance Criteria
#   # [] I can edit existing links
#   # [] I can more links to an adventure
#   # [] If I add a link, I must submit a link address
#   # [] If I add a link, I may also add a link name
#   # [] I can click a button to add a new link
#
#   scenario "authenticated user successfully adds another link to adventure",
#   js: true do
#     user = FactoryGirl.create(:user)
#     sign_in(user)
#     bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
#     adventure = FactoryGirl.create(:adventure, user_id: user.id)
#     bucket_list_adventure = FactoryGirl.create(
#       :bucket_list_adventure,
#       adventure_id: adventure.id,
#       bucket_list_id: bucket_list.id
#     )
#     link = FactoryGirl.create(:link, adventure_id: adventure.id)
#
#     visit edit_adventure_path(adventure)
#     click_button "Add link"
#
#     link_name_fields = page.all("Link name:")
#     fill_in link_name_fields[1], with: "Wikitravel - Jinja"
#
#     link_address_fields = page.all("Link address:")
#     fill_in link_address_fields[1], with: "wikitravel.org/en/Jinja"
#
#     click_button "Save It!"
#
#     expect(page).to have_content("Changes saved!")
#     expect(page).not_to have_content("Address can't be blank")
#     expect(page).not_to have_content("Link address can't be blank")
#   end
#
#   scenario "authenticated user successfully edits a link name and address",
#   js: true do
#     user = FactoryGirl.create(:user)
#     sign_in(user)
#     bucket_list = FactoryGirl.create(:bucket_list, user_id: user.id)
#     adventure = FactoryGirl.create(:adventure, user_id: user.id)
#     bucket_list_adventure = FactoryGirl.create(
#       :bucket_list_adventure,
#       adventure_id: adventure.id,
#       bucket_list_id: bucket_list.id
#     )
#     link = FactoryGirl.create(:link, adventure_id: adventure.id)
#
#     visit edit_adventure_path(adventure)
#
#     fill_in "Link name:", with: "Some details"
#     fill_in "Link address:", with: "www.wikipedia.org/wiki/earth"
#
#     expect(page).to have_content("Some details")
#     expect(page).to have_content("www.wikipedia.org/wiki/earth")
#
#     click_button "Save It!"
#
#     expect(page).to have_content("Changes saved!")
#     expect(page).not_to have_content("Address can't be blank")
#     expect(page).not_to have_content("Link address can't be blank")
#   end
# end
