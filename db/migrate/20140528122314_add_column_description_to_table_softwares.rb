class AddColumnDescriptionToTableSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :description, :text
  end
end
