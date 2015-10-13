class Adventure < ActiveRecord::Base
  belongs_to :bucket_list

  reverse_geocoded_by :latitude, :longitude, address: :address
  after_validation :reverse_geocode

  validates_presence_of :name, unless: :address?
  validates_presence_of :address, unless: :name?

  validates_inclusion_of :is_achieved, in: [true, false]

  # validates :latitude, numericality: { only_float: true, allow: nil }
  # validates :longitude, numericality: { only_float: true, allow: nil }

  geocoded_by :address
  after_validation :geocode  # auto-fetch coordinates
  reverse_geocoded_by :latitude, :longitude, address: :location
  after_validation :reverse_geocode  # auto-fetch address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
