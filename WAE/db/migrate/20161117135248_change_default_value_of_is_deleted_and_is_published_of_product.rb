class ChangeDefaultValueOfIsDeletedAndIsPublishedOfProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :is_deleted, :boolean, :default => false
    change_column :products, :is_published, :boolean, :default => true
  end
end
