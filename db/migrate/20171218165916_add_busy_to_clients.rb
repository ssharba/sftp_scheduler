class AddBusyToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :busy, :boolean , default: false
  end
end
