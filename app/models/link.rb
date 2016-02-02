class Link < ActiveRecord::Base
  belongs_to :adventure

  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }

end
