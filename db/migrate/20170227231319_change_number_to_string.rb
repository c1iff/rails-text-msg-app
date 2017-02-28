class ChangeNumberToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :number, :integer
    remove_column :users, :number, :integer
    add_column :contacts, :number, :string
    add_column :users, :number, :string
  end
end
