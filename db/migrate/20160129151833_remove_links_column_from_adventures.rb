class RemoveLinksColumnFromAdventures < ActiveRecord::Migration
  def up
    remove_column :adventures, :links
  end

  def down
     add_column :adventures, :links
  end
end
