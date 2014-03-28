class AddColumnStateToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :state, :string
  end
end
