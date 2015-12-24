require "rails_helper"

describe Adventure do
  subject { FactoryGirl.build(:adventure) }

  it { should have_many :adventure_users }
  it { should have_many(:users).through(:adventure_users) }

  it { should have_many :bucket_list_adventures }
  it { should have_many(:bucket_lists).through(:bucket_list_adventures) }

  it { should validate_inclusion_of(:is_shared).in_array([true, false]) }

  # it { should have_valid(:latitude).when(40.7127837, nil) }
  # it { should_not have_valid(:latitude).when("cat", ".") }
  #
  # it { should have_valid(:longitude).when(116.4073949999, nil) }
  # it { should_not have_valid(:longitude).when("cat", ".") }
end
