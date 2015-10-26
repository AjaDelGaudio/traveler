class BucketList < ActiveRecord::Base
  belongs_to :user
  has_many :bucket_list_adventures, dependent: :destroy
  has_many :adventures, through: :bucket_list_adventures

  validates :title, presence: true
  validates_uniqueness_of :title

  validates :is_public, presence: true
  validates_inclusion_of :is_public, in: [true, false]

  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
