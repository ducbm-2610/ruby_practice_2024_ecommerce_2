class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total, null: false
      t.string :status, null: false, default: "pending"
      t.string :payment_type, null: false
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
