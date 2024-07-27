class UserPayment < ApplicationRecord
  belongs_to :user, optional: true
end
