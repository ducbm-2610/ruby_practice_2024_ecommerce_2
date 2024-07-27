class CartsController < ApplicationController
  include CartsHelper
  include UsersHelper

  before_action :check_and_redirect, only: %i(add)
  before_action :load_cart, only: %i(checkout)

  def add
    product_id = params.dig(:cart_item, :product_id).to_s
    quantity = params.dig(:cart_item, :quantity).to_i
    @item = Product.find_by id: product_id

    initialize_session

    if session[:cart][product_id]
      handle_session_cart @item, quantity
    else
      session[:cart][product_id] = quantity
    end

    load_cart
    respond_to(&:js)
  end

  def remove
    id = params[:id].to_s
    session[:cart].delete(id)
    load_cart
    respond_to(&:js)
  end

  def checkout
    @order = Order.new
  end

  private
  def check_and_redirect
    return if user_signed_in?

    respond_to do |format|
      format.html{redirect_to new_user_session_path}
      format.js{render js: "window.location = '#{new_user_session_path}'"}
    end
  end

  def handle_session_cart item, quantity
    if session[:cart][item.id.to_s] + quantity <= item.quantity
      session[:cart][item.id.to_s] += quantity
    else
      respond_to do |format|
        format.js{render js: "window.location = '#{product_path(item)}'"}
      end
      flash[:warning] =
        "Item total in cart exceeds the remaining quantity of the
        products. Please try again !"
    end
  end
end
