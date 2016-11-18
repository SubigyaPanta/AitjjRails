class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :facebook
      t.string :twitter
      t.string :google
      t.references :user

      t.timestamps
    end
  end
end
