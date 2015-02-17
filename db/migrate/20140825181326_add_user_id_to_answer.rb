class AddUserIdToAnswer < ActiveRecord::Migration
  def up
  	add_column :answers, :user_id, :integer
  	add_index :answers, :user_id
  end

  def down
  	remove_column :answers, :user_id
  	remove_index :answers, :user_id
  end
end
