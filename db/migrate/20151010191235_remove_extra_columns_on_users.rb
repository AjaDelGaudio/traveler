class RemoveExtraColumnsOnUsers < ActiveRecord::Migration
  def up
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone
    remove_column :users, :home_city
    remove_column :users, :home_state
    remove_column :users, :home_country
    remove_column :users, :bio
  end

  def down
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :home_city, :string
    add_column :users, :home_state, :string
    add_column :users, :home_country, :string
    add_column :users, :bio, :string
  end
end
