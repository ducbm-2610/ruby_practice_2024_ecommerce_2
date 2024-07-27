class OrdersController < ApplicationController
  include CartsHelper
  before_action :load_cart, only: %i(create show index)

  def new
    @order = Order.new
  end

  def create
    @order = current_user.order.new(order_params)
    @order.total = @total_price + 25

    ActiveRecord::Base.transaction do
      unless @order.save
        raise ActiveRecord::Rollback, "Order could not be created"
      end

      create_order_items

      reset_cart

      redirect_to order_path(@order.id),
                  notice: "Order was successfully created."
    end
  rescue StandardError => e
    flash[:danger] = e.message
  end

  def show
    @order = current_user.order.find_by id: params[:id]
  end

  def index
    @pagy, @orders = pagy current_user.order.newest, items: Settings.digit_10
  end

  def cancel
    @order = current_user.order.find_by id: params[:id]
    if @order.pending?
      @order.cancelled!
      flash[:notice] = "Order has been cancelled."
    else
      flash[:alert] = "Only unprocessed orders can be cancelled."
    end
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:payment_type, :user_address_id)
  end

  def create_order_items
    @cart.each do |item|
      @order.order_item.create!(
        product_id: item[:item].id,
        quantity: item[:quantity]
      )
    end
  end
end
