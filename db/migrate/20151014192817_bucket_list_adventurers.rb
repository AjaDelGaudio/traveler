class BucketListAdventurers < ActiveRecord::Migration
  def change
    create_table :bucket_list_adventures do |t|
      t.integer :bucket_list_id, null: false
      t.integer :adventure_id, null: false
      t.boolean :is_achieved, defalut: false, null: false
      t.text :notes

      t.timestamps null: false
    end
  end
end
