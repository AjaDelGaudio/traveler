class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_address, null: false
      t.string :link_name
      t.belongs_to :adventure, index: true, null: false

      t.timestamps null: false
    end
  end
end
