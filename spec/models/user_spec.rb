require 'rails_helper'

describe User do
  subject { FactoryGirl.build(:user) }
  it { should have_many(:adventures).through(:adventure_users) }
  it { should have_many(:bucket_lists) }

  it { should have_valid(:username).when('useruser', 'iamauser12345') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should validate_uniqueness_of(:username) }
  
  it { should have_valid(:email).when('user@mailhere.com', 'thisuser@mail.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', '@', 'usermail.com', 'user@mail') }
end
