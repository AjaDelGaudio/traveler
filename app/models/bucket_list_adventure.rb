class BucketListAdventure < ActiveRecord::Base
  belongs_to :bucket_list
  belongs_to :adventure

  validates :bucket_list_id, presence: true
  validates :bucket_list_id, numericality: { only_integer: true }
  validates :adventure_id, presence: true
  validates :adventure_id, numericality: { only_integer: true }
  validates :is_achieved, inclusion: { in: [true, false] }
end
