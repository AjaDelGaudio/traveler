class AdventureUser < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :user

  validates :adventure, presence: true
  validates :adventure, numericality: { only_integer: true }

  validates :user, presence: true
  validates :user, numericality: { only_integer: true }
end
