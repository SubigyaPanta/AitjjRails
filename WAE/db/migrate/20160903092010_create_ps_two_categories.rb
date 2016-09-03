class CreatePsTwoCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :ps_two_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
