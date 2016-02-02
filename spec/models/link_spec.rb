require "rails_helper"

describe Adventure do
  subject { FactoryGirl.build(:link) }
  it { should belong_to(:adventure) }

end
