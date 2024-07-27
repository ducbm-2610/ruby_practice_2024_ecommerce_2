class Product < ApplicationRecord
  belongs_to :product_category, optional: true
  belongs_to :user, optional: true

  scope :newest, ->{order created_at: :desc}
  scope :lowest_price, ->{order price: :asc}
end
