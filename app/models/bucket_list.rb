class BucketList < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title

  validates_inclusion_of :is_public, in: [true, false]
end
