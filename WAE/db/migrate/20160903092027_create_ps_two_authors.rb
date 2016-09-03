class CreatePsTwoAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :ps_two_authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
