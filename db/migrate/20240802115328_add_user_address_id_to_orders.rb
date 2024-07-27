class AddUserAddressIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_address_id, :bigint, :null =>  false
    add_foreign_key :orders, :user_addresses
    add_index :orders, :user_address_id
  end
end
