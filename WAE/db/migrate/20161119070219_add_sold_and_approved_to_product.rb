class AddSoldAndApprovedToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_sold, :boolean, :default => false
    add_column :products, :is_approved, :boolean, :default => true
  end
end
