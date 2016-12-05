class CreateMessageTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :message_templates do |t|
      t.string :name
      t.string :message

      t.timestamps
    end
    add_index :message_templates, :name, unique: true
  end
end
