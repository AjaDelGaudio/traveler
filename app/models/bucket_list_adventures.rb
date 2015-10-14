class User < ActiveRecord::Base
  belongs_to :bucket_list
  belongs_to :adventure

  validates :bucket_list_id, presence: true
  validates :user_id, presence: true
  validates_inclusion_of :is_achieved, in: [true, false]
end
