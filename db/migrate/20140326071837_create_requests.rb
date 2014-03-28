class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :software_id
      t.string :project_code
      t.integer :user_id

      t.timestamps
    end
  end
end
