class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :demo_url
      t.string :repository_url

      t.timestamps
    end
  end
end
