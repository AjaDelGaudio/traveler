class AdventureUsers < ActiveRecord::Migration
  def up
    create_table :adventure_users do |t|
      t.belongs_to :adventure, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :adventure_users
  end
end
