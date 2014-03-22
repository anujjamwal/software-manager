class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :license_id
      t.integer :user_id
      t.string :project_code

      t.timestamps
    end
  end
end
