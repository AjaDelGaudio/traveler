class Link < ActiveRecord::Base
  belongs_to :adventure

  # validates :adventure_id, presence: true
  # validates :adventure_id, numericality: { only_integer: true }

  validates :link_address, presence: true
end
