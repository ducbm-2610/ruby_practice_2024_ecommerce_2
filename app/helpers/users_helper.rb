module UsersHelper
  def current_user_addresses
    current_user.user_address.newest
  end

  def current_user_payment_methods
    current_user.user_payment.newest
  end
end
