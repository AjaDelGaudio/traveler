class DropTableAdventureUsers < ActiveRecord::Migration
  def up
    drop_table(:adventure_users, if_exits: true)
  end

  def down
  end
end
