class CreatePsTwoQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :ps_two_quotations do |t|
      t.references :ps_two_authors, foreign_key: true
      t.references :ps_two_categories, foreign_key: true
      t.text :quote

      t.timestamps
    end
  end
end
