class Product < ApplicationRecord
  belongs_to :product_category, optional: true
  belongs_to :user, optional: true

  scope :newest, ->{order created_at: :desc}
  scope :lowest_price, ->{order price: :asc}

  def self.ransackable_attributes _auth_object = nil
    %w(created_at description id name price product_category_id
      quantity updated_at user_id)
  end
end
