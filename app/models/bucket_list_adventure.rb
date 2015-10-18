class BucketListAdventure < ActiveRecord::Base
  belongs_to :bucket_list
  belongs_to :adventure

  validates_inclusion_of :is_achieved, in: [true, false]

  include PgSearch
  pg_search_scope :search,
    against: [:name, :address],
    using: {
      tsearch: { prefix: true }
    }

end
