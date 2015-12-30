module UserSignIn
  def sign_in
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def user_sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end


  def sign_in_with_adventures
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_bucket_list_path
    fill_in "Title", with: "First Bucket List"
    click_button "Save It!"

    visit new_adventure_path
    fill_in "Name", with: "Go pearl diving"
    select "First Bucket List", from: "Bucket list"
    click_button "Toss it in!"

    visit new_bucket_list_path
    fill_in "Title", with: "Second Bucket List"
    click_button "Save It!"

    visit new_adventure_path
    fill_in "Name", with: "Paint something"
    select "Second Bucket List", from: "Bucket list"
    click_button "Toss it in!"
  end
end
