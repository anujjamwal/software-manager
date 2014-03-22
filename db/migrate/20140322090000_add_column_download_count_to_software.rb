class AddColumnDownloadCountToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :download_count, :integer
  end
end
