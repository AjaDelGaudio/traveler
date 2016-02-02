class Link < ActiveRecord::Base
  belongs_to :adventure

  it { should validate_presence_of(:link_address) }
  it { should have_valid(:link_address).when("www.wikipedia.com", "https://www.google.com") }
  it { should_not have_valid(:link_address).when(nil, " ") }
end
