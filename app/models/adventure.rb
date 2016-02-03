class Adventure < ActiveRecord::Base
  geocoded_by :address   # can also be an IP address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  belongs_to :user
  has_many :bucket_list_adventures, dependent: :destroy
  has_many :bucket_lists, through: :bucket_list_adventures
  has_many :links

  accepts_nested_attributes_for :bucket_list_adventures, allow_destroy: true
  accepts_nested_attributes_for :bucket_lists
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }

  validates :address, presence: true

  validates :is_achieved, inclusion: { in: [true, false] }

  validates :is_shared, inclusion: { in: [true, false] }

  validates :latitude, numericality: { only_float: true, allow_blank: true }
  validates :longitude, numericality: { only_float: true, allow_blank: true }

  include PgSearch
  pg_search_scope :search,
    against: [:name, :address, :notes],
    using: {
      tsearch: { prefix: true }
    }
end
