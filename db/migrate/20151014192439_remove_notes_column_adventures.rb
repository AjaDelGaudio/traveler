class RemoveNotesColumnAdventures < ActiveRecord::Migration
  def up
    remove_column :adventures, :notes
  end

  def down
    add_column :adventures, :notes, :text
  end
end
