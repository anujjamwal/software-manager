class RemoveColumnPolicyIdFromSoftwares < ActiveRecord::Migration
  def change
    remove_column :softwares, :policy_id
  end
end
