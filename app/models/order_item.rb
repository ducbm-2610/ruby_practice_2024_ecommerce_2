class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  has_one :product, dependent: :nullify
end
