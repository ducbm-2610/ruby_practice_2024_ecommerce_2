class ProductCategory < ApplicationRecord
  has_many :product, dependent: :destroy
end
