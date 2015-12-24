class DropIsSharedFromBucketListAdventure < ActiveRecord::Migration
  def up
    remove_column :bucket_list_adventures, :is_shared
  end

  def down
    add_column :bucket_list_adventures, :is_shared, :boolean, default: false, null: false
  end
end
