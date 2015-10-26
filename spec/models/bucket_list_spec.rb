require 'rails_helper'

describe BucketList do
  subject { FactoryGirl.build(:bucket_list) }
  it { should belong_to(:user) }
  it { should have_many(:adventures).through(:bucket_list_adventures) }

  it { should validate_presence_of(:title) }
  it { should have_valid(:title).when("New Mexico", "South Africa with Kam") }
  it { should_not have_valid(:title).when(nil, " ") }
  it { should validate_uniqueness_of(:title) }

  it { should validate_inclusion_of(:is_public).in_array([true, false]) }

  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }
  it { should have_valid(:user_id).when(1, 300) }
  it { should_not have_valid(:user_id).when(nil, " ") }
end
