class AddColumnsNameAndPermissionsToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :name, :string
    add_column :roles, :permissions, :text, limit: 2048
  end
end
