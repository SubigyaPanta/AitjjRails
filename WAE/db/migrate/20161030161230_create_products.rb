class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.json :features
      t.string :product_no
      t.boolean :is_deleted
      t.boolean :is_published
      t.string :color
      t.decimal :standard_cost, precision: 8, scale: 2
      t.decimal :selling_price, precision: 8, scale: 2
      t.decimal :weight
      t.references :user, foreign_key:true
      t.integer :quantity_total
      t.integer :quantity_sold
      t.date :sell_start_date
      t.date :sell_end_date

      t.timestamps
    end
  end
end
