class AddUserAssociationToAdventures < ActiveRecord::Migration
  def up
    add_column :adventures, :user, :belongs_to
  end

  def down
    remove_column :adventures, :user
  end
end
