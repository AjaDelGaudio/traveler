require 'rails_helper'

describe BucketListAdventure do
  # subject { FactoryGirl.build(:bucket_list) }
  it { should belong_to(:bucket_list) }
  it { should belong_to(:adventure) }

  it { should validate_numericality_of(:bucket_list_id) }
  it { should validate_numericality_of(:adventure_id) }

  it { should validate_inclusion_of(:is_achieved).in_array([true, false]) }
end
