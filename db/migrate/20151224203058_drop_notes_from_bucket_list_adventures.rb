class DropNotesFromBucketListAdventures < ActiveRecord::Migration
  def up
    remove_column :bucket_list_adventures, :notes
  end

  def down
    add_column :bucket_list_adventures, :notes, :text
  end
end
