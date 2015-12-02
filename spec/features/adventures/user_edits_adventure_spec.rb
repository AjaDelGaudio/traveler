require "rails_helper"

feature "user edits adventure", %(
  As a last minute traveler or traveler who's stay is unexpectedly extended,
  I want to edit an adventure
  So I can make changes on the fly.
) do
  # Acceptance Criteria
  # [x] I must be signed in to edit an adventure
  # [x] I must provide a either a name, address, or both
  # [x] If my edits do not provide a name or address, I recieve an error message
  # [x] I may edit to include or delete text notes about the adventure
  # [x] I may edit to mark the adventure as achieved or not if I choose
  # [x] I can change the bucket list I would like my adventure associated with
  #    by selecting from a dropdown list
  # [x] I recieve a success message when I successfully edit an adventure

  scenario "authenticated user successfully edits an adventure" do

    visit edit_adventure_path

  end

end
