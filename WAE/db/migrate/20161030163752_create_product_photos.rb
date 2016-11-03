class CreateProductPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :product_photos do |t|
      t.references :product, foreign_key: true
      t.string :link, limit: 512
      t.boolean :is_primary
      t.boolean :is_deleted, :default => false
      t.boolean :is_published, :default => true

      t.timestamps
    end
  end
end
