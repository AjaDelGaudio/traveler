class UsersBucketLists < ActiveRecord::Migration
  def up
    drop_table(:users_bucket_lists, if_exists: true)
  end

  def down
  end
end
