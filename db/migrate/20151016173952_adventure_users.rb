class AdventureUsers < ActiveRecord::Migration
  def change
    create_table :adventure_users do |t|
      t.integer :adventure_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
