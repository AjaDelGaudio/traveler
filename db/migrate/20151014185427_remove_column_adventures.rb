class RemoveColumnAdventures < ActiveRecord::Migration
  def up
    remove_column :adventures, :is_achieved
  end

  def down
    add_column :adventures, :is_achieved, :boolean, default: false, null: false
  end
end
