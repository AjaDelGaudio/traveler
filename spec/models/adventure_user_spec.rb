require "rails_helper"

describe Adventure do
  subject { FactoryGirl.build(:adventure_user) }

  it { should belong_to(:adventure) }
  it { should belong_to(:user) }
end
