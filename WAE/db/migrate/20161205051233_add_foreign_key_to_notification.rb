class AddForeignKeyToNotification < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :notifications, :users, column: :receiver_id
    add_foreign_key :notifications, :users, column: :sender_id
  end
end
