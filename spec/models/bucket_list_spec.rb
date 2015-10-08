require 'rails_helper'

RSpec.describe BucketList, type: :model do
  subject { FactoryGirl.build(:bucket_list) }
  # it { should have_many(:users)}
  # it { should have_many(:destinations)}

  it { should have_valid(:title).when('New Mexico', 'South East Asia with Kam') }
  it { should_not have_valid(:title).when(nil, '') }
  it { should validate_uniqueness_of(:title) }

  it { should validate_inclusion_of(:is_public).in_array([true, false]) }
end
