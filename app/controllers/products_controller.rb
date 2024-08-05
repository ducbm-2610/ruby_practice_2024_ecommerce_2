class ProductsController < ApplicationController
  include ProductsHelper
  include CartsHelper

  before_action :initialize_session
  before_action :load_cart
  before_action :find_product, except: %i(index new create)
  before_action :check_admin, except: %i(index show)

  def index
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy @q.result.newest, items: Settings.digit_10
  end

  def show
    @product_category = @product.product_category
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product),
                  notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was successfully deleted."
  end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product

    redirect_to root_path
    flash[:warning] = "Product not found !"
  end

  def product_params
    params.require(:product).permit(:user_id, :name, :description, :price, :quantity,
                                    :product_category_id, :image)
  end

  def check_admin
    redirect_to root_path, alert: "Not authorized" unless current_user&.admin?
  end
end
