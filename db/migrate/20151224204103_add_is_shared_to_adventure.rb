class AddIsSharedToAdventure < ActiveRecord::Migration
  def up
    add_column :adventures, :is_shared, :boolean, default: false, null: false
  end

  def down
    remove_column :adventures, :is_shared
  end
end
