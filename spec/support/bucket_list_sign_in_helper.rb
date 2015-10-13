module BucketListSignIn
  def bucket_list_sign_in
    bucket_list = FactoryGirl.create(:bucket_list)

    visit new_user_session_path
    fill_in 'Email', with: bucket_list.user.email
    fill_in 'Password', with: bucket_list.user.password
    click_button 'Log in'
  end
end
