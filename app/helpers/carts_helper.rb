module CartsHelper
  def load_cart
    product_ids = session[:cart].keys
    products = Product.indexed_by_id(product_ids)

    valid_cart_items = session[:cart].select do |product_id|
      products[product_id.to_i]
    end

    @cart = valid_cart_items.map do |product_id, quantity|
      {item: products[product_id.to_i], quantity:}
    end

    @total_price = @cart.sum do |cart_item|
      cart_item[:item].price * cart_item[:quantity]
    end
  end

  def initialize_session
    session[:cart] ||= {}
  end

  def reset_cart
    session[:cart] = {}
  end
end
