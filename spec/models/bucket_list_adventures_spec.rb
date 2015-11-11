require 'rails_helper'

describe BucketListAdventure do
  subject { FactoryGirl.build(:bucket_list_adventure) }
  it { should belong_to(:bucket_list) }
  it { should belong_to(:adventure) }

  it { should validate_presence_of(:bucket_list_id) }
  it { should validate_numericality_of(:bucket_list_id) }
  it { should have_valid(:bucket_list_id).when(1, 300) }
  it { should_not have_valid(:bucket_list_id).when(nil, " ") }

  it { should validate_presence_of(:adventure_id) }
  it { should validate_numericality_of(:adventure_id) }
  it { should have_valid(:adventure_id).when(1, 300) }
  it { should_not have_valid(:adventure_id).when(nil, " ") }

  it { should validate_inclusion_of(:is_achieved).in_array([true, false]) }
end
