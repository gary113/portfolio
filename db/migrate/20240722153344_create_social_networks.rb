class CreateSocialNetworks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_networks do |t|
      t.string :social_network_name, null: false
      t.string :social_network_url, null: false
      t.integer :social_network_status, null: false, default: 0, limit: 1
      t.integer :social_network_position, null: false

      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
