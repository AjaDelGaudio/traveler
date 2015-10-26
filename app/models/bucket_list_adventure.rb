class BucketListAdventure < ActiveRecord::Base
  belongs_to :bucket_list
  belongs_to :adventure

  validates :title, presence: true
  validates_inclusion_of :is_achieved, in: [true, false]
end
