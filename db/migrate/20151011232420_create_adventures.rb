class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :bucket_list_id, null: false
      t.boolean :is_achieved, defalut: false, null: false
      t.text :notes

      t.timestamps null: false
    end
  end
end
