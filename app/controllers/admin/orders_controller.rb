class Admin::OrdersController < Admin::BaseController
  before_action :find_order, except: %i(index)

  def index
    @pagy, @orders = pagy Order.all.newest_pending, items: Settings.digit_10
  end

  def show; end

  def cancel
    if @order.update(status: "canceled", description: params[:reason])
      flash[:notice] = "Order was successfully canceled."
    else
      flash[:alert] = "Order cancellation failed."
    end
    redirect_to @order
  end

  def confirm
    if @order.update(status: "confirmed")
      flash[:notice] = "Order was successfully confirmed."
    else
      flash[:alert] = "Order confirmation failed."
    end
    redirect_to @order
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    return if @order

    redirect_to admin_orders_path
    flash[:warning] = "Order not found !"
  end
end
