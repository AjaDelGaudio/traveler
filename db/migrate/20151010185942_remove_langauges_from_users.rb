class RemoveLangaugesFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :languages
  end

  def down
    add_column :users, :languages, :string
  end

end
