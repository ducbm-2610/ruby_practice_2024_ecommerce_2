class Product < ApplicationRecord
  belongs_to :product_category, optional: true
  belongs_to :user, optional: true

  scope :newest, ->{order created_at: :desc}
  scope :lowest_price, ->{order price: :asc}
  scope :indexed_by_id, ->(ids){where(id: ids).index_by(&:id)}

  def self.ransackable_attributes _auth_object = nil
    %w(created_at description id name price product_category_id
      quantity updated_at user_id)
  end
end
