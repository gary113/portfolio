class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.integer :profile_status, limit: 1, null: false, default: 0
      t.string :profile_email
      t.string :profile_phone
      t.string :profile_greeting
      t.text :profile_home_text
      t.text :profile_about_text

      t.timestamps
    end
  end
end
