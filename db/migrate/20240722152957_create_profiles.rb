class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :profile_name, null: false
      t.integer :profile_status, null: false, default: 0, limit: 1
      t.string :profile_email
      t.string :profile_phone
      t.string :profile_greeting
      t.text :profile_home_text

      t.timestamps
    end
  end
end
