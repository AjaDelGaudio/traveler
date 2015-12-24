class AddNullConstraintToAdventures < ActiveRecord::Migration
  def up
    change_column :adventures, :user_id, :integer, null: false
  end

  def down
    change_column :adventures, :user_id, :integer
  end
end
