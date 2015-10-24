class AdventureUsers < ActiveRecord::Migration
  def up
    create_table :adventure_users do |t|
      t.integer :adventure_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :adventure_users
  end
end
