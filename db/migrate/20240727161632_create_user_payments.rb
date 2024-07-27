class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.string :payment_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
