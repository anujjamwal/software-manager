class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :software_id
      t.string :license_user
      t.text :license, limit: 4096
      t.integer :user_count
      t.date :purchase_date
      t.date :valid_upto
      t.integer :cost

      t.timestamps
    end
  end
end
