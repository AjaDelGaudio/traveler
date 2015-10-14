class RemoveIndexBucketLists < ActiveRecord::Migration
  def up
    remove_index :bucket_lists, :title
  end
  
  def down
    add_index :bucket_lists, :title, unique: true
  end
end
