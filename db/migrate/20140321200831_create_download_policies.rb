class CreateDownloadPolicies < ActiveRecord::Migration
  def change
    create_table :download_policies do |t|
      t.string :type

      t.timestamps
    end
  end
end
