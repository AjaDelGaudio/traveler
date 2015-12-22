class AddLinkAttributeToAdventure < ActiveRecord::Migration
  def up
    add_column :adventures, :link, :string
  end
  
  def down
    remove_column :adventures, :link
  end
end
