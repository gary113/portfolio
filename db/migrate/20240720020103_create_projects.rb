class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.integer :project_status, limit: 1, null: false, default: 0
      t.string :project_name
      t.string :project_description
      t.string :project_demo_url
      t.string :project_repository_url

      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
