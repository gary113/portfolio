class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :message_email, null: false
      t.string :message_subject, null: false
      t.text :message_content, null: false
      t.integer :message_status, limit: 1, null: false, default: 0

      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
