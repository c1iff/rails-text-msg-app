class AddConnectionsContactsMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
    add_column :messages, :user_id, :integer
    add_column :messages, :contact_id, :integer
  end
end
