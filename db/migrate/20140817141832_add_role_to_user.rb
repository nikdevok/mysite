class AddRoleToUser < ActiveRecord::Migration
  def up
  	add_column :users, :roles, :string
  	add_column :users, :roles_mask, :integer
  end

  def down
  	remove_column :users, :roles
  	remove_column :users, :roles_mask
  end
end
