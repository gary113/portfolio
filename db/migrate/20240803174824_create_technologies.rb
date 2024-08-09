class CreateTechnologies < ActiveRecord::Migration[7.1]
  def change
    create_table :technologies do |t|
      t.string :technology_name, null: false
      t.integer :technology_position, null: false

      t.timestamps
    end
  end
end
