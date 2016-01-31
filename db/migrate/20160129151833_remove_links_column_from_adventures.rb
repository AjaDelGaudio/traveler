class RemoveLinksColumnFromAdventures < ActiveRecord::Migration
  def up
    remove_column :adventures, :link
  end

  def down
     add_column :adventures, :link, :string
  end
end
