class RemoveRsvpFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :rsvp
  end
end
