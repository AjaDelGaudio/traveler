class DropIsAchievedFromBucketListAdventures < ActiveRecord::Migration
  def up
    remove_column :bucket_list_adventures, :is_achieved
  end

  def down
    add_column :bucket_list_adventures, :is_achieved, :boolean, default: false, null: false
  end
end
