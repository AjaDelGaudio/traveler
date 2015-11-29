class AdventureUser < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :user

  validates :adventure_id, presence: true
  validates :adventure_id, numericality: { only_integer: true }

  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
