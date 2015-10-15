class DropColumnAdventures < ActiveRecord::Migration
  def up
    remove_column :adventures, :bucket_list_id
  end
  def down
    add_column :adventures, :bucket_list_id, :integer
  end
end
