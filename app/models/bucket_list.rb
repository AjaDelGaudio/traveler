class BucketList < ActiveRecord::Base
  belongs_to :user
  has_many :adventures

  validates :title, presence: true
  validates_uniqueness_of :title

  validates_inclusion_of :is_public, in: [true, false]

  validates :user_id, numericality: { only_integer: true }
end
