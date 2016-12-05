class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :message_templates, foreign_key: true
      t.string :url
      t.references :receiver, references: :users
      t.references :sender, references: :users
      t.boolean :is_seen, default: false

      t.timestamps
    end
  end
end
