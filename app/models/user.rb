class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_address, dependent: :destroy
  has_many :user_payment, dependent: :destroy
  has_many :product, dependent: :destroy
  has_many :order, dependent: :destroy
end
