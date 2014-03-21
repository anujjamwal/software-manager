class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :path
      t.integer :operating_system_id
      t.string :state

      t.timestamps
    end
  end
end
