class CreateSocialNetworks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_networks do |t|
      t.integer :social_network_type
      t.string :social_network_url

      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
