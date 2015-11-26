require "rails_helper"

describe Adventure do
  subject { FactoryGirl.build(:adventure) }

  it { should have_many :adventure_users }
  it { should have_many(:users).through(:adventure_users) }

  it { should have_many :bucket_list_adventures }
  it { should have_many(:bucket_lists).through(:bucket_list_adventures) }

  it { should have_valid(:name).when("Visit Sue", "Eat alligator") }
  it { should have_valid(:address).when("Paris, France", "1 A St., NYC") }

  it { should have_valid(:latitude).when(40.7127837, 39.904211) }
  it { should_not have_valid(:latitude).when("cat", ".") }
  it { should validate_numericality_of(:latitude)
    .is_greater_than_or_equal_to(-180) }
  it { should validate_numericality_of(:latitude)
    .is_less_than_or_equal_to(180) }

  it { should have_valid(:longitude).when(116.4073949999, 116.4073949999) }
  it { should_not have_valid(:longitude).when("cat", ".") }
  it { should validate_numericality_of(:longitude)
    .is_greater_than_or_equal_to(-180) }
  it { should validate_numericality_of(:longitude)
    .is_less_than_or_equal_to(180) }
end
