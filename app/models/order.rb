class Order < ApplicationRecord
  has_many :order_item, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :user_address, optional: true

  scope :newest, ->{order created_at: :desc}

  enum status: {pending: 0, confirmed: 1, cancelled: 2}
end
