require "rails_helper"

feature "authenticated user deletes an adventure", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to delete an adventure
  So I can throw away my dreams.
) do
# Acceptance Criteria
# [x] I can click a link to delete an adventure
# [x] I receive an success message after deleting an adventure
# [x] After I delete an adventure it is no longer visible

  scenario "authenticated user sucessfully deletes an adventure" do
    adventure = FactoryGirl.create(:adventure)

    sign_in
    visit edit_adventure_path(adventure)
    click_link "Delete"

    expect(page).to have_content("Adventure deleted")
    expect(page).not_to have_content(adventure.title)
  end

  scenario "unauthenticated user fails to delete an adventure" do
    visit edit_adventure_path(adventure)

    expect(page).to have_content("Log in")
    expect(page).not_to have_content("Delete")
  end
end
