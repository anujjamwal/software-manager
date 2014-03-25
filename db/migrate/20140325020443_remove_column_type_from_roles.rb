class RemoveColumnTypeFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :type
  end
end
