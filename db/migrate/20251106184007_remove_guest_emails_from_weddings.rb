class RemoveGuestEmailsFromWeddings < ActiveRecord::Migration[8.0]
  def change
    remove_column :weddings, :guest_emails
  end
end
