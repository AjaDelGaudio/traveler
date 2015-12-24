class Adventure < ActiveRecord::Base
  has_many :bucket_list_adventures, dependent: :destroy
  has_many :bucket_lists, through: :bucket_list_adventures

  has_many :adventure_users, dependent: :destroy
  has_many :users, through: :adventure_users

  accepts_nested_attributes_for :bucket_lists
  accepts_nested_attributes_for :bucket_list_adventures

  validate :name_or_address

  validates :is_achieved, inclusion: { in: [true, false] }

  validates :is_shared, inclusion: { in: [true, false] }

  validates :latitude, numericality: { only_float: true, allow_blank: true }
  validates :longitude, numericality: { only_float: true, allow_blank: true }

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

  private

  def name_or_address
    if name.blank? && address.blank?
      errors.add(:adventure, "Must specify a name and/or address")
    end
  end
end
