require 'rails_helper'

describe Adventure do
  subject { FactoryGirl.build(:adventure) }

  it { should have_many(:bucket_list_adventures) }

  # it { should have_valid(:name).when('Visit Sue', 'Eat alligator') }
  # it { should have_valid(:address).when('Paris, France', '33 Harrison Ave, Boston') }
  # it { should_not have_valid(:name).when(nil, '') }
  # it { should_not have_valid(:address).when(nil, '') }

  it {should allow_value(nil).for(:latitude)}
  # it { should have_valid(:latitude).when(40.7127837, 39.904211) }
  # it { should_not have_valid(:latitude).when('cat', '.') }
  # it { should validate_numericality_of(:latitude).is_greater_than_or_equal_to (-180) }
  # it { should validate_numericality_of(:latitude).is_less_than_or_equal_to (180) }

  it {should allow_value(nil).for(:longitude)}
  # it { should have_valid(:longitude).when(116.4073949999, 116.4073949999) }
  # it { validates_numericality_of(:longitude).is_greater_than_or_equal_to (-180) }
  # it { validates_numericality_of(:longitude).is_less_than_or_equal_to (180) }

  # it { should validate_inclusion_of(:is_achieved).in_array([true, false]) }

  # it { should have_valid(:bucket_list_id).when(1, 237) }
  # it { should_not have_valid(:bucket_list_id).when(nil, '') }
  # it { should validate_numericality_of(:bucket_list_id) }
end
