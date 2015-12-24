class AddUserIdToAdventures < ActiveRecord::Migration
  def up
    add_reference :adventures, :user, index: true, foreign_key: true
  end
  
  def down
    remove_reference :products, :user, index: true, foreign_key: true
  end
end
