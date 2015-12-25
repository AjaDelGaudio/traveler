class DropTableAdventureUsers02 < ActiveRecord::Migration
  def up
    drop_table :adventure_users, if_exits: true
  end

  def down
    create_table :adventure_users do |t|
      t.belongs_to :adventure, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
