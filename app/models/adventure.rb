class Adventure < ActiveRecord::Base
  has_many :bucket_list_adventures, dependent: :destroy
  has_many :bucket_lists, through: :bucket_list_adventures

  has_many :adventure_users, dependent: :destroy
  has_many :users, through: :adventure_users

  accepts_nested_attributes_for :bucket_lists
  accepts_nested_attributes_for :bucket_list_adventures

  validates :name, presence: true, unless: :address?

  validates :latitude, numericality: { only_float: true, allow_blank: true }
  validates :latitude, numericality: { less_than_or_equal_to: 180 }
  validates :latitude, numericality: { greater_than_or_equal_to: -180 }

  validates :longitude, numericality: { only_float: true, allow_blank: true }
  validates :longitude, numericality: { less_than_or_equal_to: 180 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180 }

  include PgSearch
  pg_search_scope :search,
    against: [:name, :address],
    using: {
      tsearch: { prefix: true }
    }

  reverse_geocoded_by :latitude, :longitude, address: :address
  after_validation :reverse_geocode

  geocoded_by :address
  after_validation :geocode  # auto-fetch coordinates
  reverse_geocoded_by :latitude, :longitude, address: :address
  after_validation :reverse_geocode  # auto-fetch address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
