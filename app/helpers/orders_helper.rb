module OrdersHelper
  def current_user_orders
    current_user.order.newest
  end
end
