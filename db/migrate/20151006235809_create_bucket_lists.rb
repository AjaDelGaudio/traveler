class CreateBucketLists < ActiveRecord::Migration
  def change
    create_table :bucket_lists do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :is_public, defalut: false, null: false

      t.timestamps null: false
    end

    add_index :bucket_lists, :title, unique: true
  end
end
