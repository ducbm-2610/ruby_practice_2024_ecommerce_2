class UserPayment < ApplicationRecord
  belongs_to :user, optional: true

  scope :newest, ->{order created_at: :desc}
end
