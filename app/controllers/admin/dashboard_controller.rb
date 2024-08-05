class Admin::DashboardController < Admin::BaseController
  layout "admin/base"

  def index
    @pagy, @products = pagy current_user.product.newest,
                            items: Settings.digit_10
  end
end
