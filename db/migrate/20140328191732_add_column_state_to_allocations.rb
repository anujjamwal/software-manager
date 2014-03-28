class AddColumnStateToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :state, :string
  end
end
