class AddIsSharedAttributeToBucketListAdventures < ActiveRecord::Migration
  def up
    add_column :bucket_list_adventures, :is_shared, :boolean, default: false, null: false
  end

  def down
    remove_column :bucket_list_adventures, :is_shared
  end
end
