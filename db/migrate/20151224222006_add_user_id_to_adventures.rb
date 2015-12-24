class AddUserIdToAdventures < ActiveRecord::Migration
  def up
    add_reference :adventures, :user, index: true, foreign_key: true
    change_column :adventures, :user, :integer, null: false
  end

  def down
    remove_reference :adventures, :user, index: true, foreign_key: true
  end
end
