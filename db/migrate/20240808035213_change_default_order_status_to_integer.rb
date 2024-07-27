class ChangeDefaultOrderStatusToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :status, from: "pending", to: 0
    change_column :orders, :status, :integer, using: 'status::integer'
  end
end
