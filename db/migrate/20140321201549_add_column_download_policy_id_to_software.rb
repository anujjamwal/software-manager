class AddColumnDownloadPolicyIdToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :download_policy_id, :integer
  end
end
