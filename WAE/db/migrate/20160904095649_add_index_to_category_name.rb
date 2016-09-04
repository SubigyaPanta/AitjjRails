class AddIndexToCategoryName < ActiveRecord::Migration[5.0]
  def change
    add_index :ps_two_categories, :name, :unique => true
  end
end
