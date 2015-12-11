module BucketListSignIn
  def bucket_list_sign_in
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_bucket_list_path
    fill_in "Title", with: "First Bucket List"
    click_button "Save It!"
  end
end
