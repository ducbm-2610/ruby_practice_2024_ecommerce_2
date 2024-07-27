class Product < ApplicationRecord
  belongs_to :product_category, optional: true
  belongs_to :user, optional: true
end
