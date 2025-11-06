class CreateGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.timestamps
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :rsvp
      t.references :wedding, null: false, foreign_key: true
    end
  end
end
