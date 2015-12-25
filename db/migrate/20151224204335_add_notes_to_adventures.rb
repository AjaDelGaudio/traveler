class AddNotesToAdventures < ActiveRecord::Migration
  def up
    add_column :adventures, :notes, :text
  end

  def down
    remove_column :adventures, :notes
  end
end
