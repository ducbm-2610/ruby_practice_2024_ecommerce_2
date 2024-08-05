class Order < ApplicationRecord
  has_many :order_item, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :user_address, optional: true

  scope :newest, ->{order created_at: :desc}
  scope :newest_pending, ->{where(status: "pending").order(created_at: :desc)}
end
