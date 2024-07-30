class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false
      t.references :product, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
    add_foreign_key :order_items, :orders, column: :order_id
    add_foreign_key :order_items, :products, column: :product_id
  end
end
